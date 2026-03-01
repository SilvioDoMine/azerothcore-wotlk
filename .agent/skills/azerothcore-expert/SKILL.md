---
name: AzerothCore Expert
description: Specialized knowledge and guidance for AzerothCore development - the WoTLK 3.3.5a MMORPG server emulator focused on modularity and community contributions
---

# AzerothCore Expert Skill

This skill provides expert guidance for developing, modifying, and maintaining AzerothCore servers. AzerothCore is a fork of TrinityCore specifically focused on WoTLK 3.3.5a with an emphasis on modularity, stability, and community modules.

## Overview

AzerothCore is an open-source MMORPG framework written in C++ that emulates a World of Warcraft 3.3.5a (WoTLK) server. It distinguishes itself from TrinityCore through its extensive module system and focus on backward compatibility.

### Key Features

- **WoTLK 3.3.5a Focus**: Dedicated to one expansion for maximum quality
- **Module System**: Powerful hooks system for extending without modifying core
- **Stable API**: Emphasis on backward compatibility for modules
- **Community Catalogue**: Extensive collection of community modules
- **Docker Support**: Easy deployment with Docker

## Architecture

### Directory Structure (This Repository)
```
azerothcore-wotlk/
├── src/
│   ├── common/           # Shared utilities, threading, crypto
│   ├── server/
│   │   ├── apps/         # worldserver, authserver executables
│   │   ├── database/     # Database abstraction layer
│   │   ├── game/         # Core game logic (~624 files)
│   │   │   ├── Accounts/       # Account management
│   │   │   ├── AI/             # NPC AI systems
│   │   │   ├── Entities/       # Player, Creature, GameObject, Item
│   │   │   ├── Grids/          # Grid system for visibility
│   │   │   ├── Guilds/         # Guild system
│   │   │   ├── Handlers/       # Packet handlers
│   │   │   ├── Instances/      # Instance/Raid management
│   │   │   ├── Maps/           # Map and zone logic
│   │   │   ├── Scripting/      # Script hooks
│   │   │   ├── Spells/         # Spell system
│   │   │   └── World/          # World state management
│   │   ├── scripts/      # Built-in content scripts
│   │   │   ├── Commands/       # GM commands
│   │   │   ├── EasternKingdoms/
│   │   │   ├── Kalimdor/
│   │   │   ├── Northrend/
│   │   │   ├── Outland/
│   │   │   ├── Spells/
│   │   │   └── World/
│   │   └── shared/       # Shared server utilities
│   └── tools/            # Map extractors, assembler
├── modules/              # External modules directory
├── data/sql/             # SQL files
│   ├── base/             # Initial database structure
│   ├── updates/          # Incremental updates
│   └── custom/           # Custom SQL
├── conf/                 # Configuration templates
├── deps/                 # Dependencies (boost, mysql, etc.)
└── doc/                  # Documentation
```

### Core Components

#### 1. WorldServer
Main game server handling all game logic:
- Player session management
- World state updates
- Spell processing
- Combat calculation
- Script execution

#### 2. AuthServer
Authentication and realm management:
- Account authentication (SRP6)
- Realm list serving
- Session validation

#### 3. Database Layer
Three primary databases:
- **acore_auth**: Account data, bans, realm info
- **acore_characters**: Character saves, guilds, mail
- **acore_world**: Templates, spawns, quests, items

## Script System

### Hook-Based Architecture
AzerothCore uses a hook system where scripts register for specific events:

```cpp
class MyPlayerScript : public PlayerScript
{
public:
    // Register for specific hooks only (performance optimization)
    MyPlayerScript() : PlayerScript("MyPlayerScript", {
        PLAYERHOOK_ON_LOGIN,
        PLAYERHOOK_ON_LOGOUT,
        PLAYERHOOK_ON_LEVEL_CHANGED
    }) { }
    
    void OnPlayerLogin(Player* player) override
    {
        ChatHandler(player->GetSession()).SendSysMessage("Welcome!");
    }
    
    void OnPlayerLogout(Player* player) override
    {
        // Cleanup logic
    }
    
    void OnLevelChanged(Player* player, uint8 oldLevel) override
    {
        if (player->GetLevel() == 80)
        {
            ChatHandler(player->GetSession()).SendSysMessage("Max level reached!");
        }
    }
};

void AddMyPlayerScript()
{
    new MyPlayerScript();
}
```

### Available Script Types

#### PlayerScript Hooks
```cpp
PLAYERHOOK_ON_LOGIN              // Player logged in
PLAYERHOOK_ON_LOGOUT             // Player logged out
PLAYERHOOK_ON_UPDATE             // Player tick update
PLAYERHOOK_ON_CHAT               // Chat message
PLAYERHOOK_ON_LEVEL_CHANGED      // Level changed
PLAYERHOOK_ON_MONEY_CHANGED      // Gold changed
PLAYERHOOK_ON_LOOT_ITEM          // Looted item
PLAYERHOOK_ON_STORE_NEW_ITEM     // Received item (any source)
PLAYERHOOK_CAN_USE_ITEM          // Can equip/use item check
PLAYERHOOK_ON_MAP_CHANGED        // Changed zone/map
PLAYERHOOK_ON_PVP_KILL           // Killed another player
```

#### WorldScript Hooks
```cpp
WORLDHOOK_ON_STARTUP             // Server startup complete
WORLDHOOK_ON_SHUTDOWN            // Server shutting down
WORLDHOOK_ON_AFTER_CONFIG_LOAD   // Config (re)loaded
WORLDHOOK_ON_UPDATE              // World tick
```

#### CreatureScript
```cpp
class boss_my_boss : public CreatureScript
{
public:
    boss_my_boss() : CreatureScript("boss_my_boss") { }
    
    struct boss_my_bossAI : public BossAI
    {
        boss_my_bossAI(Creature* creature) : BossAI(creature, 0) { }
        
        void JustEngagedWith(Unit* who) override
        {
            Talk(0); // Use creature_text
            _JustEngagedWith(who);
            events.ScheduleEvent(EVENT_SPELL_1, 5s);
        }
        
        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;
                
            events.Update(diff);
            
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SPELL_1:
                        DoCastVictim(SPELL_FIREBALL);
                        events.ScheduleEvent(EVENT_SPELL_1, 10s);
                        break;
                }
            }
            
            DoMeleeAttackIfReady();
        }
    };
    
    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_my_bossAI(creature);
    }
};
```

#### CommandScript
```cpp
class my_commandscript : public CommandScript
{
public:
    my_commandscript() : CommandScript("my_commandscript") { }
    
    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable mySubCommands =
        {
            { "info",    HandleMyInfoCommand,    SEC_PLAYER, Console::No },
            { "reload",  HandleMyReloadCommand,  SEC_GAMEMASTER, Console::Yes }
        };
        
        static ChatCommandTable commandTable =
        {
            { "mymod", mySubCommands }
        };
        
        return commandTable;
    }
    
    static bool HandleMyInfoCommand(ChatHandler* handler, Optional<PlayerIdentifier> target)
    {
        Player* player = target ? target->GetConnectedPlayer() : handler->getSelectedPlayer();
        if (!player)
        {
            handler->SendSysMessage("No player selected.");
            return false;
        }
        
        handler->PSendSysMessage("Player: {}", player->GetName());
        return true;
    }
    
    static bool HandleMyReloadCommand(ChatHandler* handler)
    {
        // Reload logic
        handler->SendSysMessage("Reloaded!");
        return true;
    }
};
```

## Database Operations

### Using Singletons
```cpp
// Get database instances
CharacterDatabase
WorldDatabase
LoginDatabase
```

### Prepared Statements (Recommended)
```cpp
// Query with prepared statement
CharacterDatabasePreparedStatement* stmt = 
    CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHARACTER);
stmt->SetData(0, guid);
PreparedQueryResult result = CharacterDatabase.Query(stmt);

if (result)
{
    do
    {
        Field* fields = result->Fetch();
        uint32 val1 = fields[0].Get<uint32>();
        std::string val2 = fields[1].Get<std::string>();
    } while (result->NextRow());
}
```

### Direct Queries (For Custom Tables)
```cpp
// Simple query
QueryResult result = CharacterDatabase.Query(
    "SELECT * FROM my_custom_table WHERE guid = {}", guid);

// Execute without result
CharacterDatabase.Execute(
    "UPDATE my_custom_table SET value = {} WHERE guid = {}", newValue, guid);

// Transaction for multiple operations
auto trans = CharacterDatabase.BeginTransaction();
trans->Append("DELETE FROM my_table WHERE guid = {}", guid);
trans->Append("INSERT INTO my_table (guid, data) VALUES ({}, '{}')", guid, data);
CharacterDatabase.CommitTransaction(trans);
```

### Async Operations
```cpp
// Async query with callback
CharacterDatabase.AsyncQuery(
    CharacterDatabase.GetPreparedStatement(CHAR_SEL_DATA))
    .WithPreparedCallback([playerGuid = player->GetGUID()](PreparedQueryResult result) {
        // Find player (might have disconnected)
        Player* player = ObjectAccessor::FindPlayer(playerGuid);
        if (!player)
            return;
            
        if (result)
        {
            // Process result safely
        }
    });
```

## Configuration System

### Module Configuration
```conf
# conf/mod_mymodule.conf.dist

[mod_mymodule]

# Enable the module
MyModule.Enabled = 1

# Feature settings
MyModule.Feature.Rate = 1.5
MyModule.Feature.MaxValue = 100
```

### Loading Configuration
```cpp
void MyModule::LoadConfig()
{
    _enabled = sConfigMgr->GetOption<bool>("MyModule.Enabled", true);
    _rate = sConfigMgr->GetOption<float>("MyModule.Feature.Rate", 1.0f);
    _maxValue = sConfigMgr->GetOption<int32>("MyModule.Feature.MaxValue", 100);
}
```

## Utility Classes

### GameTime
```cpp
#include "GameTime.h"

time_t now = GameTime::GetGameTime();
uint32 diff = GameTime::GetUptime();
```

### ObjectAccessor
```cpp
#include "ObjectAccessor.h"

// Find online player by GUID
Player* player = ObjectAccessor::FindPlayer(playerGuid);

// Find any player (online only)
Player* player = ObjectAccessor::FindPlayerByName("PlayerName");

// Find creature
Creature* creature = ObjectAccessor::GetCreature(*player, creatureGuid);
```

### ObjectMgr
```cpp
#include "ObjectMgr.h"

// Get templates
CreatureTemplate const* ct = sObjectMgr->GetCreatureTemplate(entry);
ItemTemplate const* it = sObjectMgr->GetItemTemplate(entry);
QuestTemplate const* qt = sObjectMgr->GetQuestTemplate(questId);
```

### ChatHandler
```cpp
#include "Chat.h"

ChatHandler handler(player->GetSession());

// Simple message
handler.SendSysMessage("Hello!");

// Formatted message (C++20 format)
handler.PSendSysMessage("Hello, {}! You have {} gold.", 
    player->GetName(), player->GetMoney() / GOLD);

// Colored message
handler.PSendSysMessage("|cff00ff00SUCCESS|r: Operation completed.");
```

### Color Codes
```
|cff00ff00  - Green
|cffff0000  - Red  
|cffffffff  - White
|cffffcc00  - Gold/Yellow
|cff0070dd  - Rare (Blue)
|cffa335ee  - Epic (Purple)
|cffff8000  - Legendary (Orange)
```

## Build System

### Requirements
- CMake 3.16+
- C++17 compiler (GCC 8+, Clang 7+, MSVC 2019+)
- OpenSSL 1.1+
- MySQL 5.7+ or MariaDB 10.5+
- Boost 1.74+

### Build Commands
```bash
# Create build directory
mkdir build && cd build

# Configure
cmake .. \
    -DCMAKE_INSTALL_PREFIX=/home/user/acore \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DWITH_WARNINGS=1 \
    -DTOOLS_BUILD=all \
    -DMODULES=static

# Build
make -j$(nproc)

# Install
make install
```

### Docker Build
```bash
# Using docker-compose
docker-compose up -d

# Build images
docker-compose build
```

## Debugging

### Log Levels
```conf
# worldserver.conf
LogLevel = 3

# Appender Configuration
Appender.Console = 1,3,0
Appender.Server = 2,2,0,Server.log
Logger.server = 3,Console Server
Logger.sql = 3,Console Server
```

### Common Debug Patterns
```cpp
// Log message
LOG_INFO("module", "Info message");
LOG_DEBUG("module", "Debug: value = {}", value);
LOG_ERROR("module", "Error occurred");

// Conditional logging
if (sConfigMgr->GetOption<bool>("MyModule.Debug", false))
{
    LOG_DEBUG("mymodule", "Debug info: {}", debugData);
}
```

## Best Practices

### 1. Use Hook Registration
Always specify which hooks your script uses for performance:
```cpp
MyScript() : PlayerScript("MyScript", {
    PLAYERHOOK_ON_LOGIN  // Only register for needed hooks
}) { }
```

### 2. Safe Player Access
```cpp
void OnPlayerUpdate(Player* player, uint32 diff) override
{
    if (!player || !player->IsInWorld())
        return;
    
    // Safe to use player
}
```

### 3. Use Transactions for Multiple Writes
```cpp
auto trans = CharacterDatabase.BeginTransaction();
for (auto& item : items)
{
    trans->Append("INSERT INTO ...");
}
CharacterDatabase.CommitTransaction(trans);
```

### 4. Cache Configuration
```cpp
// In class
struct Config
{
    bool Enabled;
    float Rate;
};
Config _config;

// Load once
void LoadConfig()
{
    _config.Enabled = sConfigMgr->GetOption<bool>("Mod.Enabled", true);
    _config.Rate = sConfigMgr->GetOption<float>("Mod.Rate", 1.0f);
}

// Use cached value
const Config& GetConfig() const { return _config; }
```

### 5. Thread Safety
The world update loop is single-threaded. Be careful with:
- Async callbacks
- External threads
- Static variables

## Common Patterns

### Singleton Pattern
```cpp
class MySystem
{
public:
    static MySystem* instance()
    {
        static MySystem instance;
        return &instance;
    }
    
    // ... methods
    
private:
    MySystem() = default;
};

#define sMySystem MySystem::instance()
```

### Cache Pattern
```cpp
class PlayerCache
{
    std::unordered_map<uint32, CachedData> _cache;
    
public:
    void AddToCache(uint32 guid, CachedData data)
    {
        _cache[guid] = std::move(data);
    }
    
    void RemoveFromCache(uint32 guid)
    {
        _cache.erase(guid);
    }
    
    CachedData* GetFromCache(uint32 guid)
    {
        auto it = _cache.find(guid);
        return it != _cache.end() ? &it->second : nullptr;
    }
};
```

## Resources

- **Official Wiki**: https://www.azerothcore.org/wiki
- **GitHub**: https://github.com/azerothcore/azerothcore-wotlk
- **Discord**: https://discord.gg/azerothcore
- **Module Catalogue**: https://www.azerothcore.org/catalogue.html
- **Issue Tracker**: https://github.com/azerothcore/azerothcore-wotlk/issues
