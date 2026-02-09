---
name: AzerothCore Module System Expert
description: Expert guidance for creating, structuring, and developing AzerothCore modules with hooks, scripts, and best practices
---

# AzerothCore Module System Expert Skill

Complete guide to developing modules for AzerothCore. Modules extend the server without modifying core code, ensuring easy updates and community sharing.

## Module Architecture Overview

Modules are loaded from the `modules/` directory and integrated via CMake at build time. They can be static (compiled into worldserver) or dynamic (loaded at runtime).

### Module Directory Structure

```
modules/mod-my-module/
├── CMakeLists.txt           # Optional, for advanced builds
├── mod-my-module.cmake      # Optional, advanced CMake config
├── README.md                # Documentation
├── conf/
│   └── mod_my_module.conf.dist   # Configuration template
├── data/
│   └── sql/
│       ├── db-characters/
│       │   └── base/
│       │       └── mod_my_module.sql
│       └── db-world/
│           └── base/
│               └── mod_my_module_data.sql
└── src/
    ├── mod_my_module_loader.cpp  # Script loader (REQUIRED)
    ├── MyModuleCore.h             # Core class header
    ├── MyModuleCore.cpp           # Core class implementation
    ├── MyModulePlayerScript.cpp   # Player hooks
    ├── MyModuleWorldScript.cpp    # World hooks  
    └── MyModuleCommandScript.cpp  # Commands
```

## Creating a New Module

### Method 1: Using `create_module.sh`
```bash
cd modules/
./create_module.sh mod-my-module
```

### Method 2: Manual Creation

#### 1. Script Loader (REQUIRED)
`src/mod_my_module_loader.cpp`:
```cpp
// Forward declarations from individual script files
void AddMyModulePlayerScript();
void AddMyModuleWorldScript();
void AddMyModuleCommandScript();

// Called by AzerothCore module auto-loader
// Function name MUST be: Add<module-folder-name>Scripts (with underscores for dashes)
void Addmod_my_moduleScripts()
{
    AddMyModuleWorldScript();
    AddMyModulePlayerScript();
    AddMyModuleCommandScript();
}
```

#### 2. World Script (Initialization)
`src/MyModuleWorldScript.cpp`:
```cpp
#include "MyModuleCore.h"
#include "WorldScript.h"
#include "Config.h"

class MyModuleWorldScript : public WorldScript
{
public:
    MyModuleWorldScript() : WorldScript("MyModuleWorldScript", {
        WORLDHOOK_ON_AFTER_CONFIG_LOAD,
        WORLDHOOK_ON_STARTUP,
        WORLDHOOK_ON_UPDATE
    }) { }

    void OnAfterConfigLoad(bool reload) override
    {
        sMyModule->LoadConfig();
        
        if (reload)
            sMyModule->ReloadData();
    }

    void OnStartup() override
    {
        sMyModule->Initialize();
        sMyModule->LoadFromDB();
    }

    void OnUpdate(uint32 diff) override
    {
        sMyModule->Update(diff);
    }
};

void AddMyModuleWorldScript()
{
    new MyModuleWorldScript();
}
```

#### 3. Player Script (Player Events)
`src/MyModulePlayerScript.cpp`:
```cpp
#include "MyModuleCore.h"
#include "Chat.h"
#include "Player.h"
#include "PlayerScript.h"

class MyModulePlayerScript : public PlayerScript
{
public:
    MyModulePlayerScript() : PlayerScript("MyModulePlayerScript", {
        PLAYERHOOK_ON_LOGIN,
        PLAYERHOOK_ON_LOGOUT,
        PLAYERHOOK_ON_LEVEL_CHANGED,
        PLAYERHOOK_ON_STORE_NEW_ITEM
    }) { }

    void OnPlayerLogin(Player* player) override
    {
        if (!sMyModule->IsEnabled())
            return;

        uint32 guid = player->GetGUID().GetCounter();
        sMyModule->OnPlayerLogin(guid);
        
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cff00ff00[MyModule]|r Welcome back!");
    }

    void OnPlayerLogout(Player* player) override
    {
        if (!sMyModule->IsEnabled())
            return;

        uint32 guid = player->GetGUID().GetCounter();
        sMyModule->OnPlayerLogout(guid);
    }

    void OnLevelChanged(Player* player, uint8 oldLevel) override
    {
        if (!sMyModule->IsEnabled())
            return;

        sMyModule->OnLevelUp(player, oldLevel, player->GetLevel());
    }

    void OnPlayerStoreNewItem(Player* player, Item* item, uint32 count) override
    {
        if (!sMyModule->IsEnabled() || !item)
            return;

        sMyModule->OnItemReceived(player, item->GetEntry(), count);
    }
};

void AddMyModulePlayerScript()
{
    new MyModulePlayerScript();
}
```

#### 4. Core Singleton Class
`src/MyModuleCore.h`:
```cpp
#ifndef MOD_MY_MODULE_H
#define MOD_MY_MODULE_H

#include "Common.h"
#include <unordered_map>

class Player;

struct MyModuleData
{
    uint32 Value1;
    uint32 Value2;
    time_t LastUpdate;
};

class MyModule
{
public:
    static MyModule* instance()
    {
        static MyModule instance;
        return &instance;
    }

    // Configuration
    struct Config
    {
        bool Enabled = true;
        float Rate = 1.0f;
        uint32 MaxValue = 100;
    };

    void LoadConfig();
    const Config& GetConfig() const { return _config; }
    bool IsEnabled() const { return _config.Enabled; }

    // Lifecycle
    void Initialize();
    void LoadFromDB();
    void ReloadData();
    void Update(uint32 diff);

    // Player events
    void OnPlayerLogin(uint32 guid);
    void OnPlayerLogout(uint32 guid);
    void OnLevelUp(Player* player, uint8 oldLevel, uint8 newLevel);
    void OnItemReceived(Player* player, uint32 itemEntry, uint32 count);

    // Data access
    MyModuleData* GetData(uint32 guid);
    void SaveData(uint32 guid);

private:
    MyModule() = default;
    ~MyModule() = default;

    Config _config;
    std::unordered_map<uint32, MyModuleData> _dataCache;
    uint32 _updateTimer = 0;
};

#define sMyModule MyModule::instance()

#endif // MOD_MY_MODULE_H
```

`src/MyModuleCore.cpp`:
```cpp
#include "MyModuleCore.h"
#include "Config.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "Player.h"
#include "Chat.h"

void MyModule::LoadConfig()
{
    _config.Enabled = sConfigMgr->GetOption<bool>("MyModule.Enabled", true);
    _config.Rate = sConfigMgr->GetOption<float>("MyModule.Rate", 1.0f);
    _config.MaxValue = sConfigMgr->GetOption<uint32>("MyModule.MaxValue", 100);

    LOG_INFO("module", "[MyModule] Config loaded: Enabled={}, Rate={}", 
        _config.Enabled, _config.Rate);
}

void MyModule::Initialize()
{
    LOG_INFO("module", "[MyModule] Initializing...");
}

void MyModule::LoadFromDB()
{
    LOG_INFO("module", "[MyModule] Loading data from database...");
    
    QueryResult result = CharacterDatabase.Query(
        "SELECT guid, value1, value2, last_update FROM mod_my_module");
    
    if (!result)
    {
        LOG_INFO("module", "[MyModule] No existing data found.");
        return;
    }

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        uint32 guid = fields[0].Get<uint32>();
        
        MyModuleData data;
        data.Value1 = fields[1].Get<uint32>();
        data.Value2 = fields[2].Get<uint32>();
        data.LastUpdate = fields[3].Get<uint32>();
        
        _dataCache[guid] = data;
        ++count;
    } while (result->NextRow());

    LOG_INFO("module", "[MyModule] Loaded {} records.", count);
}

void MyModule::ReloadData()
{
    _dataCache.clear();
    LoadFromDB();
}

void MyModule::Update(uint32 diff)
{
    if (!_config.Enabled)
        return;

    _updateTimer += diff;
    
    // Run every 60 seconds
    if (_updateTimer >= 60000)
    {
        _updateTimer = 0;
        // Periodic tasks here
    }
}

void MyModule::OnPlayerLogin(uint32 guid)
{
    // Load or create data for player
    auto it = _dataCache.find(guid);
    if (it == _dataCache.end())
    {
        MyModuleData data{};
        data.LastUpdate = time(nullptr);
        _dataCache[guid] = data;
    }
}

void MyModule::OnPlayerLogout(uint32 guid)
{
    SaveData(guid);
    _dataCache.erase(guid);
}

void MyModule::OnLevelUp(Player* player, uint8 oldLevel, uint8 newLevel)
{
    if (newLevel == 80)
    {
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cff00ff00[MyModule]|r Congratulations on max level!");
    }
}

void MyModule::OnItemReceived(Player* player, uint32 itemEntry, uint32 count)
{
    // Handle special items
}

MyModuleData* MyModule::GetData(uint32 guid)
{
    auto it = _dataCache.find(guid);
    return it != _dataCache.end() ? &it->second : nullptr;
}

void MyModule::SaveData(uint32 guid)
{
    auto it = _dataCache.find(guid);
    if (it == _dataCache.end())
        return;

    const auto& data = it->second;
    CharacterDatabase.Execute(
        "REPLACE INTO mod_my_module (guid, value1, value2, last_update) VALUES ({}, {}, {}, {})",
        guid, data.Value1, data.Value2, data.LastUpdate);
}
```

#### 5. Command Script
`src/MyModuleCommandScript.cpp`:
```cpp
#include "MyModuleCore.h"
#include "Chat.h"
#include "Player.h"
#include "CommandScript.h"

using namespace Acore::ChatCommands;

class MyModuleCommandScript : public CommandScript
{
public:
    MyModuleCommandScript() : CommandScript("MyModuleCommandScript") { }

    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable mymoduleSubCommands =
        {
            { "info",    HandleInfoCommand,    SEC_PLAYER,     Console::No  },
            { "reload",  HandleReloadCommand,  SEC_GAMEMASTER, Console::Yes },
            { "set",     HandleSetCommand,     SEC_GAMEMASTER, Console::No  }
        };

        static ChatCommandTable commandTable =
        {
            { "mymodule", mymoduleSubCommands }
        };

        return commandTable;
    }

    static bool HandleInfoCommand(ChatHandler* handler)
    {
        Player* player = handler->GetPlayer();
        if (!player)
            return false;

        if (!sMyModule->IsEnabled())
        {
            handler->SendSysMessage("Module is disabled.");
            return true;
        }

        uint32 guid = player->GetGUID().GetCounter();
        MyModuleData* data = sMyModule->GetData(guid);
        
        if (!data)
        {
            handler->SendSysMessage("No data found.");
            return true;
        }

        handler->PSendSysMessage("Value1: {}, Value2: {}", data->Value1, data->Value2);
        return true;
    }

    static bool HandleReloadCommand(ChatHandler* handler)
    {
        sMyModule->ReloadData();
        handler->SendSysMessage("MyModule data reloaded.");
        return true;
    }

    static bool HandleSetCommand(ChatHandler* handler, uint32 value)
    {
        Player* target = handler->getSelectedPlayer();
        if (!target)
        {
            handler->SendSysMessage("No player selected.");
            return false;
        }

        uint32 guid = target->GetGUID().GetCounter();
        MyModuleData* data = sMyModule->GetData(guid);
        
        if (!data)
        {
            handler->SendSysMessage("Player has no module data.");
            return false;
        }

        data->Value1 = value;
        sMyModule->SaveData(guid);
        
        handler->PSendSysMessage("Set Value1 to {} for {}.", value, target->GetName());
        return true;
    }
};

void AddMyModuleCommandScript()
{
    new MyModuleCommandScript();
}
```

#### 6. Configuration File
`conf/mod_my_module.conf.dist`:
```conf
###################################
# MyModule Configuration
###################################

[worldserver]

###################################
# MYMODULE SETTINGS
###################################

#  MyModule.Enabled
#    Enable the module
#    Default: 1 (enabled)
MyModule.Enabled = 1

#  MyModule.Rate
#    Rate multiplier
#    Default: 1.0
MyModule.Rate = 1.0

#  MyModule.MaxValue
#    Maximum allowed value
#    Default: 100
MyModule.MaxValue = 100
```

#### 7. SQL Files
`data/sql/db-characters/base/mod_my_module.sql`:
```sql
DROP TABLE IF EXISTS `mod_my_module`;
CREATE TABLE `mod_my_module` (
  `guid` INT UNSIGNED NOT NULL,
  `value1` INT UNSIGNED NOT NULL DEFAULT 0,
  `value2` INT UNSIGNED NOT NULL DEFAULT 0,
  `last_update` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

## Available Script Hooks

### WorldScript Hooks
```cpp
WORLDHOOK_ON_OPEN_STATE_CHANGE
WORLDHOOK_ON_AFTER_CONFIG_LOAD      // Config (re)loaded
WORLDHOOK_ON_LOAD_CUSTOM_DATABASE_TABLE
WORLDHOOK_ON_BEFORE_CONFIG_LOAD
WORLDHOOK_ON_MOTD_CHANGE
WORLDHOOK_ON_SHUTDOWN_INITIATE
WORLDHOOK_ON_SHUTDOWN_CANCEL
WORLDHOOK_ON_SHUTDOWN
WORLDHOOK_ON_STARTUP                // Server started
WORLDHOOK_ON_UPDATE                 // World tick
```

### PlayerScript Hooks
```cpp
PLAYERHOOK_ON_PLAYER_JUST_DIED
PLAYERHOOK_ON_PLAYER_KILLED_BY_CREATURE
PLAYERHOOK_ON_LEVEL_CHANGED
PLAYERHOOK_ON_PVP_KILL
PLAYERHOOK_ON_CREATURE_KILL
PLAYERHOOK_ON_CREATE
PLAYERHOOK_ON_DELETE
PLAYERHOOK_ON_SAVE
PLAYERHOOK_ON_BIND_TO_INSTANCE
PLAYERHOOK_ON_UPDATE_ZONE
PLAYERHOOK_ON_MAP_CHANGED
PLAYERHOOK_ON_QUEST_STATUS_CHANGE
PLAYERHOOK_ON_LOGIN                 // Player logged in
PLAYERHOOK_ON_LOGOUT                // Player logged out
PLAYERHOOK_ON_CHAT                  // Sent chat message
PLAYERHOOK_ON_MONEY_CHANGED
PLAYERHOOK_ON_GIVE_XP
PLAYERHOOK_ON_REPUTATION_CHANGE
PLAYERHOOK_ON_DUEL_START
PLAYERHOOK_ON_DUEL_END
PLAYERHOOK_ON_EMOTE
PLAYERHOOK_ON_LOOT_ITEM
PLAYERHOOK_ON_STORE_NEW_ITEM        // Received item (any source)
PLAYERHOOK_ON_UPDATE
PLAYERHOOK_CAN_USE_ITEM
PLAYERHOOK_CAN_EQUIP_ITEM
PLAYERHOOK_CAN_UNEQUIP_ITEM
PLAYERHOOK_CAN_BUY_ITEM_IN_STORE
PLAYERHOOK_CAN_SELL_ITEM
```

### CreatureScript Hooks
```cpp
// Override these in your CreatureAI class
JustEngagedWith(Unit* who)      // Combat started
JustDied(Unit* killer)          // Creature died
KilledUnit(Unit* victim)        // Killed a target
UpdateAI(uint32 diff)           // AI tick
Reset()                         // Reset to initial
SpellHit(Unit* caster, SpellInfo*)
DamageTaken(Unit* attacker, uint32& damage)
EnterEvadeMode()
MoveInLineOfSight(Unit* who)
```

## Building Modules

### Static Build (Recommended)
```bash
cmake .. -DMODULES=static
make -j$(nproc)
```

### Dynamic Build
```bash
cmake .. -DMODULES=dynamic
make -j$(nproc)
```

### Disable Specific Module
Create `.gitkeep` or delete the module folder from `modules/`.

## Best Practices

### 1. Always Check If Enabled
```cpp
void OnPlayerLogin(Player* player) override
{
    if (!sMyModule->IsEnabled())
        return;
    // ... rest of code
}
```

### 2. Use Hook Registration for Performance
```cpp
// GOOD: Only registers for needed hooks
MyScript() : PlayerScript("MyScript", {
    PLAYERHOOK_ON_LOGIN,
    PLAYERHOOK_ON_LOGOUT
}) { }

// AVOID: Registers for ALL hooks (performance impact)
MyScript() : PlayerScript("MyScript") { }
```

### 3. Cache Data in Memory
```cpp
// Load on login
void OnPlayerLogin(Player* player) override
{
    _cache[player->GetGUID().GetCounter()] = LoadFromDB(guid);
}

// Save and remove on logout
void OnPlayerLogout(Player* player) override
{
    uint32 guid = player->GetGUID().GetCounter();
    SaveToDB(guid, _cache[guid]);
    _cache.erase(guid);
}
```

### 4. Use Transactions for Multiple DB Writes
```cpp
auto trans = CharacterDatabase.BeginTransaction();
trans->Append("UPDATE ...");
trans->Append("INSERT ...");
CharacterDatabase.CommitTransaction(trans);
```

### 5. Proper Logging
```cpp
LOG_INFO("module.mymodule", "Module initialized");
LOG_DEBUG("module.mymodule", "Debug: value = {}", value);
LOG_ERROR("module.mymodule", "Error: {}", errorMsg);
```

## Resources

- **Wiki - Create Module**: https://www.azerothcore.org/wiki/Create-a-Module
- **Skeleton Module**: https://github.com/azerothcore/skeleton-module
- **Module Catalogue**: https://www.azerothcore.org/catalogue.html
- **Hook Reference**: Browse `src/server/game/Scripting/*.h`
