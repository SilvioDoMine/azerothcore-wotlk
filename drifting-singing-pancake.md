# Plan: mod-vip-system - AzerothCore VIP Module

## Context

Implement a complete VIP system module for AzerothCore where a stackable item (entry 900000) grants 24h of VIP status per unit. VIP time counts down in real time (online AND offline) using epoch timestamps. When VIP expires and tokens remain in inventory, auto-consume and renew. The module follows standard AzerothCore module patterns found in `modules/`.

---

## Directory Structure

```
modules/mod-vip-system/
├── conf/
│   └── mod_vip_system.conf.dist
├── data/
│   └── sql/
│       ├── db-characters/
│       │   └── base/
│       │       └── mod_vip_system.sql
│       └── db-world/
│           └── base/
│               └── mod_vip_system_item.sql
├── src/
│   ├── mod_vip_system_loader.cpp    # CMake entry: Addmod_vip_systemScripts()
│   ├── VipSystem.h                  # Singleton header
│   ├── VipSystem.cpp                # Core logic + AddVipSystemScripts()
│   ├── VipSystemPlayerScript.cpp    # OnLogin, OnLogout, OnPlayerStoreNewItem
│   ├── VipSystemWorldScript.cpp     # OnAfterConfigLoad, OnUpdate (offline scanner timer)
│   └── VipSystemCommandScript.cpp   # .vip command
└── README.md
```

---

## File-by-File Implementation

### 1. `data/sql/db-characters/base/mod_vip_system.sql`

```sql
CREATE TABLE IF NOT EXISTS `character_vip_status` (
  `guid` INT UNSIGNED NOT NULL,
  `expires_at` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- `expires_at`: Unix epoch when VIP ends. 0 = not VIP. `> now` = active.
- Index on `expires_at` for offline scanner query (add `KEY idx_expires (expires_at)`).

### 2. `data/sql/db-world/base/mod_vip_system_item.sql`

Insert VIP Token item (entry 900000) into `item_template`:
- class=15 (Miscellaneous), Quality=3 (Rare), stackable=20, bonding=1 (BoP)
- No on-use spell (consumption handled by module hooks)
- Description: "Grants 24 hours of VIP status. Consumed automatically."

### 3. `conf/mod_vip_system.conf.dist`

```ini
[worldserver]
VipSystem.Enable = 1
VipSystem.ItemEntry = 900000
VipSystem.ConsumeOffline = 1
VipSystem.DurationPerItem = 86400
VipSystem.OfflineScanIntervalSec = 60
VipSystem.MaxConsumptionsPerScan = 50
VipSystem.MaxConsumptionsPerLogin = 30
```

Config rules per spec:
- `Enable=0`: disables everything; `.vip` says "disabled"
- `ConsumeOffline=0`: offline scanner does not run
- `ItemEntry`: configurable, overrides the default 900000

### 4. `src/VipSystem.h` - Singleton

```cpp
struct VipSystemConfig {
    bool Enabled, ConsumeOffline;
    uint32 ItemEntry, DurationPerItem, OfflineScanInterval;
    uint32 MaxConsumptionsPerScan, MaxConsumptionsPerLogin;
};

class VipSystem {
public:
    static VipSystem* instance();
    void LoadConfig();
    const VipSystemConfig& GetConfig() const;

    // Cache (online players only)
    void LoadVipStatusFromDB(uint32 guid);
    void SaveVipStatusToDB(uint32 guid);
    void RemoveFromCache(uint32 guid);

    // Core logic
    bool NormalizeVipState(Player* player);
    void OnVipItemReceived(Player* player);
    bool IsVip(uint32 guid) const;
    uint64 GetExpiresAt(uint32 guid) const;
    uint64 GetRemainingSeconds(uint32 guid) const;

    // Offline scanner
    void RunOfflineScanner();

    // Utility
    static std::string FormatDuration(uint64 seconds);

private:
    bool ConsumeTokenAndExtend(Player* player);
    VipSystemConfig _config;
    mutable std::mutex _cacheMutex;
    std::unordered_map<uint32, uint64> _vipCache; // guid -> expires_at
};
#define sVipSystem VipSystem::instance()
```

### 5. `src/VipSystem.cpp` - Core Logic

**LoadConfig()**: Read all config keys via `sConfigMgr->GetOption<T>()`.

**NormalizeVipState(Player*)** - KEY ALGORITHM:
```
1. Get guid, now, expiresAt from cache
2. If expiresAt > now → still VIP, return true
3. Loop (max MaxConsumptionsPerLogin iterations):
   a. If player has VIP token(s) in inventory:
      - DestroyItemCount(itemEntry, 1, true)
      - newExpiry = max(expiresAt, now) + DurationPerItem
      - Update cache and DB
      - If newExpiry > now → break (VIP restored)
   b. Else → break (no tokens)
4. Return IsVip(guid)
```
The loop handles the case where VIP expired long ago and multiple tokens need consuming to catch up.

**ConsumeTokenAndExtend(Player*)**: Destroys 1 item, calculates new expiry (stacks on existing if still valid, else starts from now), updates cache + DB.

**OnVipItemReceived(Player*)**: Called when VIP token enters inventory. If player is NOT VIP, call `NormalizeVipState()` to auto-consume one token.

**RunOfflineScanner()**: DB-only processing:
```sql
SELECT v.guid, ii.guid AS item_guid, ii.count
FROM character_vip_status v
JOIN characters c ON c.guid = v.guid AND c.online = 0
JOIN character_inventory ci ON ci.guid = v.guid
JOIN item_instance ii ON ii.guid = ci.item AND ii.itemEntry = ?
WHERE v.expires_at > 0 AND v.expires_at <= ?
ORDER BY v.guid
LIMIT ?
```
For each result:
- If `ii.count > 1`: `UPDATE item_instance SET count = count - 1`
- If `ii.count == 1`: `DELETE FROM item_instance` + `DELETE FROM character_inventory`
- `REPLACE INTO character_vip_status SET expires_at = now + duration`
- All in one transaction

**FormatDuration(uint64 secs)**: Returns "Xd Xh Xm Xs" string.

**IsVip(guid)**: Lock cache, check `expires_at > now`.

### 6. `src/VipSystemPlayerScript.cpp`

Hooks used (with filter):
- `PLAYERHOOK_ON_LOGIN` → `OnPlayerLogin(Player*)`
- `PLAYERHOOK_ON_LOGOUT` → `OnPlayerLogout(Player*)`
- `PLAYERHOOK_ON_STORE_NEW_ITEM` → `OnPlayerStoreNewItem(Player*, Item*, uint32)`

**OnPlayerLogin**:
1. If `!Enabled` → return
2. `LoadVipStatusFromDB(guid)` → populate cache
3. `NormalizeVipState(player)` → auto-consume expired VIP if tokens exist
4. Show VIP status message

**OnPlayerLogout**:
1. `SaveVipStatusToDB(guid)` → persist
2. `RemoveFromCache(guid)` → free memory

**OnPlayerStoreNewItem**:
1. If `item->GetEntry() != ItemEntry` → return
2. `OnVipItemReceived(player)` → auto-activate if not VIP

Confirmed: `OnPlayerStoreNewItem` fires from `Player::StoreNewItem()` which covers loot, quest rewards, vendor purchases, GM `.additem`, mail retrieval, and trade.

### 7. `src/VipSystemWorldScript.cpp`

Hooks used:
- `WORLDHOOK_ON_AFTER_CONFIG_LOAD` → `OnAfterConfigLoad(bool)`
- `WORLDHOOK_ON_UPDATE` → `OnUpdate(uint32 diff)`

**OnAfterConfigLoad**: `sVipSystem->LoadConfig()`

**OnUpdate**: Accumulate `diff` ms. When `>= OfflineScanInterval * 1000`:
- If `ConsumeOffline` is enabled, call `sVipSystem->RunOfflineScanner()`

### 8. `src/VipSystemCommandScript.cpp`

Registers `.vip` command at `SEC_PLAYER` level.

**HandleVipCommand(ChatHandler*)**:
- If `!Enabled`: "Sistema VIP desativado."
- Show: VIP active (yes/no), time remaining (formatted), tokens in inventory, total time (current + tokens * 24h)
- If total = 0: "Voce nao possui VIP ativo e nao tem itens VIP. Adquira o item (entry X) para ativar."

### 9. `src/mod_vip_system_loader.cpp`

```cpp
void AddVipSystemScripts();
void Addmod_vip_systemScripts() {
    AddVipSystemScripts();
}
```
`AddVipSystemScripts()` defined in `VipSystem.cpp`:
```cpp
void AddVipSystemScripts() {
    new VipSystemWorldScript();
    new VipSystemPlayerScript();
    new VipSystemCommandScript();
}
```

### 10. `README.md`

Brief installation guide: copy to `modules/`, rebuild, copy `.conf.dist`, import SQL files.

---

## Integration Points (Stubs)

Provide `bool VipSystem::IsVip(uint32 guid)` as the central check function. Add comments showing how other systems can use it:
```cpp
// Example: if (!sVipSystem->IsVip(player->GetGUID().GetCounter()))
//     ChatHandler(session).SendSysMessage("Apenas VIP.");
```

---

## Key References (existing code to reuse)

| API | File |
|-----|------|
| `Player::GetItemCount(entry, inBank)` | `src/server/game/Entities/Player/Player.h:1237` |
| `Player::DestroyItemCount(entry, count, update)` | `src/server/game/Entities/Player/Player.h:1340` |
| `Player::HasItemCount(entry, count, inBank)` | `src/server/game/Entities/Player/Player.h` |
| `GameTime::GetGameTime()` | `src/server/game/Time/GameTime.h` |
| `sConfigMgr->GetOption<T>(key, default)` | `src/common/Configuration/Config.h` |
| `CharacterDatabase.Query/Execute` | `src/server/database/Database/Implementation/CharacterDatabase.h` |
| `ChatHandler::PSendSysMessage` | `src/server/game/Chat/Chat.h` |
| `PlayerScript` hooks | `src/server/game/Scripting/ScriptDefines/PlayerScript.h` |
| `WorldScript` hooks | `src/server/game/Scripting/ScriptDefines/WorldScript.h` |
| `CommandScript` pattern | `src/server/scripts/Commands/cs_gear.cpp` (reference) |

---

## Verification

1. **Build**: `cd build && cmake .. && make -j$(nproc)` should compile the module automatically (CMake auto-discovers modules)
2. **SQL**: Import `mod_vip_system.sql` into characters DB, `mod_vip_system_item.sql` into world DB
3. **Config**: Copy `mod_vip_system.conf.dist` to server config directory
4. **Test scenarios**:
   - `.additem 900000 1` with no VIP → should auto-consume, activate 24h
   - `.additem 900000 2` with no VIP → consume 1, 1 remains in inventory
   - `.vip` → shows status, remaining time, token count, total time
   - VIP expires with tokens → auto-renew on login (and offline if ConsumeOffline=1)
   - `Enable=0` → `.vip` says disabled, no consumption occurs
   - Different `ItemEntry` → works with custom entry
