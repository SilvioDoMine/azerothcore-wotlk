---
name: TrinityCore Expert
description: Specialized knowledge and guidance for TrinityCore development - the open source MMORPG server emulator for World of Warcraft
---

# TrinityCore Expert Skill

This skill provides expert guidance for developing, modifying, and maintaining TrinityCore servers. TrinityCore is one of the most popular WoW server emulators, focusing on Classic, TBC, WoTLK, and other expansions.

## Overview

TrinityCore is an open-source MMORPG framework written in C++ that emulates a World of Warcraft server. It is a successor to MaNGOS and shares a common architecture with AzerothCore.

### Key Differences from AzerothCore

| Aspect | TrinityCore | AzerothCore |
|--------|-------------|-------------|
| **Focus** | Multiple expansions (Classic to Shadowlands) | WoTLK 3.3.5a only |
| **Module System** | Less modular, patches directly to core | Extensive module system with hooks |
| **Community** | Larger, more fragmented | Smaller, more focused |
| **Blizzlike** | High blizzlike focus | Balance between blizzlike and customization |
| **Updates** | Frequent core updates, can break customizations | Stable API, backward compatibility focus |

## Architecture

### Directory Structure
```
TrinityCore/
├── src/
│   ├── common/           # Shared utilities
│   ├── server/
│   │   ├── authserver/   # Login server
│   │   ├── worldserver/  # Game server
│   │   ├── game/         # Game logic
│   │   │   ├── AI/       # AI systems
│   │   │   ├── Entities/ # Players, Creatures, GameObjects
│   │   │   ├── Maps/     # Map management
│   │   │   ├── Spells/   # Spell system
│   │   │   └── Scripts/  # Built-in scripts
│   │   └── scripts/      # Content scripts (bosses, quests)
│   └── tools/            # Map extractors, etc.
├── sql/
│   ├── base/             # Base database dumps
│   ├── updates/          # Incremental updates
│   └── custom/           # Custom SQL files
└── conf/                 # Configuration templates
```

### Core Components

#### 1. AuthServer (Realm Server)
Handles authentication and realm selection:
- Account management
- Session tokens
- Realm list

#### 2. WorldServer (Game Server)
Main game server:
- World management
- Player sessions
- Game logic execution

#### 3. Database Layer
Three main databases:
- **auth** - Account information
- **characters** - Character data
- **world** - Static game data (templates, spawns)

## Script System

### Script Types
```cpp
// Player Script
class MyPlayerScript : public PlayerScript
{
public:
    MyPlayerScript() : PlayerScript("MyPlayerScript") { }
    
    void OnLogin(Player* player) override
    {
        // Handle player login
    }
};

// Creature AI Script
class boss_example : public CreatureScript
{
public:
    boss_example() : CreatureScript("boss_example") { }
    
    struct boss_exampleAI : public BossAI
    {
        boss_exampleAI(Creature* creature) : BossAI(creature, DATA_BOSS_EXAMPLE) { }
        
        void JustEngagedWith(Unit* who) override
        {
            // Combat started
        }
        
        void UpdateAI(uint32 diff) override
        {
            // AI update logic
        }
    };
    
    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_exampleAI(creature);
    }
};
```

### Available Script Hooks

#### PlayerScript Hooks
- `OnLogin(Player*)` - Player logged in
- `OnLogout(Player*)` - Player logged out
- `OnLevelChanged(Player*, uint8 oldLevel)` - Level up
- `OnMapChanged(Player*)` - Changed map
- `OnChat(Player*, uint32 type, uint32 lang, std::string& msg)` - Chat message

#### CreatureScript Hooks
- `JustEngagedWith(Unit*)` - Combat started
- `JustDied(Unit*)` - Creature died
- `KilledUnit(Unit*)` - Killed a target
- `UpdateAI(uint32 diff)` - AI tick
- `Reset()` - Reset to initial state

#### WorldScript Hooks
- `OnStartup()` - Server startup
- `OnShutdown()` - Server shutdown
- `OnConfigLoad(bool reload)` - Config loaded
- `OnUpdate(uint32 diff)` - World update tick

## Database Operations

### Prepared Statements
```cpp
// In DatabaseEnvFwd.h, add enum:
enum CharacterDatabaseStatements : uint32
{
    CHAR_SEL_MY_DATA,
    CHAR_INS_MY_DATA,
    CHAR_UPD_MY_DATA,
    // ...
};

// In CharacterDatabase.cpp, register:
PrepareStatement(CHAR_SEL_MY_DATA, 
    "SELECT data FROM my_table WHERE guid = ?", CONNECTION_SYNCH);

// Usage:
CharacterDatabasePreparedStatement* stmt = 
    CharacterDatabase.GetPreparedStatement(CHAR_SEL_MY_DATA);
stmt->setUInt32(0, playerGuid);
PreparedQueryResult result = CharacterDatabase.Query(stmt);

if (result)
{
    Field* fields = result->Fetch();
    uint32 data = fields[0].GetUInt32();
}
```

### Async Queries
```cpp
// Callback-based async query
CharacterDatabase.AsyncQuery(stmt)
    .WithCallback([player](QueryResult result) {
        if (!player) // Player might have disconnected
            return;
        
        if (result)
        {
            // Process result
        }
    });
```

## Event System (Smart AI)

### SAI (SmartAI)
TrinityCore uses SmartAI for NPC scripting via database:
```sql
-- Example SmartAI script
INSERT INTO smart_scripts 
(entryorguid, source_type, id, link, event_type, event_phase_mask, 
 event_chance, event_flags, event_param1, event_param2, event_param3, 
 event_param4, action_type, action_param1, action_param2, action_param3, 
 action_param4, action_param5, action_param6, target_type, target_param1, 
 target_param2, target_param3, target_x, target_y, target_z, target_o, comment)
VALUES
(12345, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 
'NPC Name - On Spawn - Say Line 0');
```

## Configuration

### Common Configuration Options
```conf
# worldserver.conf

# Database connections
LoginDatabaseInfo     = "127.0.0.1;3306;trinity;trinity;auth"
WorldDatabaseInfo     = "127.0.0.1;3306;trinity;trinity;world"
CharacterDatabaseInfo = "127.0.0.1;3306;trinity;trinity;characters"

# Server settings
RealmID = 1
GameType = 0
Expansion = 2

# Rates
Rate.XP.Kill    = 1
Rate.XP.Quest   = 1
Rate.Drop.Money = 1

# Anti-cheat
Anticheat.Enable = 1
```

## Build System

### Requirements
- CMake 3.16+
- C++17 compatible compiler
- OpenSSL 1.0+
- MySQL 5.7+ or MariaDB 10.5+
- Boost 1.70+

### Build Commands
```bash
# Clone repository
git clone https://github.com/TrinityCore/TrinityCore.git

# Create build directory
mkdir build && cd build

# Configure (adjust paths as needed)
cmake .. -DCMAKE_INSTALL_PREFIX=/server \
         -DTOOLS=1 \
         -DWITH_WARNINGS=1

# Build
make -j$(nproc)

# Install
make install
```

## Debugging Tips

### Enable Debug Output
```conf
# worldserver.conf
LogLevel = 3
DebugLogMask = 64
```

### Common Log Channels
- `server` - General server messages
- `network` - Network operations
- `sql` - Database queries
- `maps` - Map loading
- `scripts` - Script errors

### GDB Debugging
```bash
gdb ./worldserver
(gdb) run
# On crash:
(gdb) bt full
(gdb) info threads
```

## Best Practices

### 1. Always Use Prepared Statements
Never concatenate user input into SQL queries.

### 2. Check Pointers Before Use
```cpp
if (Player* player = unit->ToPlayer())
{
    // Safe to use player
}
```

### 3. Use GUID System Properly
```cpp
ObjectGuid guid = player->GetGUID();
uint32 lowGuid = guid.GetCounter(); // For database operations
```

### 4. Handle Async Operations Safely
Always check if the target still exists in callbacks.

### 5. Memory Management
Core handles most memory via shared pointers. Don't delete core objects.

## Common Pitfalls

1. **Modifying templates at runtime** - Templates are loaded once; changes require restart
2. **Blocking the main thread** - Use async for heavy operations
3. **Ignoring thread safety** - World updates are single-threaded, but be careful with callbacks
4. **Not handling disconnects** - Players can disconnect mid-operation

## Resources

- **Official Wiki**: https://trinitycore.atlassian.net/wiki/spaces/tc/overview
- **GitHub**: https://github.com/TrinityCore/TrinityCore
- **Discord**: TrinityCore Community Discord
- **Issue Tracker**: https://github.com/TrinityCore/TrinityCore/issues
