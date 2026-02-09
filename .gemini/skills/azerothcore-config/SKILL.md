---
name: AzerothCore Configuration Expert
description: Master guide for configuring Worldserver and Authserver in AzerothCore, covering essential settings, performance tuning, and gameplay customization
---

# AzerothCore Configuration Expert Skill

This skill provides expert knowledge on configuring the AzerothCore `worldserver` and `authserver`. Proper configuration is critical for server stability, performance, and customization.

## Configuration Files Location

Configuration files are located in the `conf/` directory (or wherever you copied them during installation).
- **Templates**: `*.conf.dist` (Do not edit these directly)
- **Active Configs**: `*.conf` (Edit these files)

To create your configuration, copy the `.dist` files and remove the `.dist` extension:
```bash
cp conf/authserver.conf.dist conf/authserver.conf
cp conf/worldserver.conf.dist conf/worldserver.conf
```

## AuthServer Configuration (`authserver.conf`)

The AuthServer handles account authentication and realm selection.

### 1. Database Connection
Connects to the `acore_auth` database.
```ini
LoginDatabaseInfo = "127.0.0.1;3306;acore;acore;acore_auth"
```
*Format*: `Host;Port;Username;Password;Database`

### 2. Network Settings
```ini
RealmServerPort = 3724
BindIP = "0.0.0.0"
```
- **BindIP**: Use `0.0.0.0` to listen on all interfaces (recommended).

### 3. Security
```ini
# Auto-ban IP/Account after failed attempts
WrongPass.MaxCount = 0    # 0 = Disabled
WrongPass.BanTime = 600   # Seconds
WrongPass.BanType = 0     # 0 = Ban IP, 1 = Ban Account
```

## WorldServer Configuration (`worldserver.conf`)

The WorldServer handles all game logic. This file is huge (>4000 lines); here are the critical sections.

### 1. Database Connections
Connects to all three databases.
```ini
LoginDatabaseInfo     = "127.0.0.1;3306;acore;acore;acore_auth"
WorldDatabaseInfo     = "127.0.0.1;3306;acore;acore;acore_world"
CharacterDatabaseInfo = "127.0.0.1;3306;acore;acore;acore_characters"
```

### 2. Realm ID
**CRITICAL**: Must match the `id` in `acore_auth.realmlist` table.
```ini
RealmID = 1
```

### 3. Game Settings (Gameplay)

#### Rates (XP and Loot)
```ini
# Experience Rates
Rate.XP.Kill    = 1
Rate.XP.Quest   = 1
Rate.XP.Explore = 1

# Loot Rates
Rate.Drop.Item.Poor      = 1
Rate.Drop.Item.Normal    = 1
Rate.Drop.Item.Uncommon  = 1
Rate.Drop.Item.Rare      = 1
Rate.Drop.Item.Epic      = 1
Rate.Drop.Item.Legendary = 1
Rate.Drop.Money          = 1
```

#### Max Level
```ini
MaxPlayerLevel = 80
```

#### Cross-Faction Interaction
Allow interaction between Alliance and Horde.
```ini
AllowTwoSide.Accounts = 1      # Create chars of both factions on same account
AllowTwoSide.Interaction.Chat = 0
AllowTwoSide.Interaction.Channel = 0
AllowTwoSide.Interaction.Group = 0
AllowTwoSide.Interaction.Guild = 0
AllowTwoSide.Interaction.Auction = 0
AllowTwoSide.Interaction.Mail = 0
AllowTwoSide.WhoList = 0
```

### 4. Performance Tuning

#### Map Management
```ini
# Number of threads for map updates. 
# Recommended: Number of CPU cores available for the server process.
MapUpdate.Threads = 1

# Preload all grids. HIGH MEMORY USAGE (~9GB+).
# Increases startup time significantly but eliminates grid loading lag.
# Only distinct '1' for high-pop/production servers with massive RAM.
PreloadAllNonInstancedMapGrids = 0
```

#### Pathfinding (Mmaps)
Movement maps allow complex pathfinding (NPCs walking around obstacles).
```ini
MoveMaps.Enable = 1
DontCacheRandomMovementPaths = 0  # 0 = Cache paths (More RAM, Less CPU)
```

#### Database Threads
For high population, you may increase worker threads.
```ini
WorldDatabase.WorkerThreads = 1
CharacterDatabase.WorkerThreads = 1
```

### 5. Logging System
AzerothCore has a powerful, granular logging system.

#### Appenders (Where to log)
Defined as `Appender.Name = Type, LogLevel, Flags, File/Args...`
```ini
# Types: 1=Console, 2=File
# Levels: 1=Fatal, 2=Error, 3=Warn, 4=Info, 5=Debug
Appender.Console = 1, 2, 0
Appender.Server  = 2, 4, 16, Server.log, w
```

#### Loggers (What to log)
Link specific systems to appenders.
```ini
Logger.root = 4, Console Server    # Default for everything
Logger.chat.say = 4, Console Server
Logger.sql.sql = 4, Console Server # Log all SQL queries (Spammy!)
```

### 6. Visibility & Distances
Controls how far players can see other units. High values increase bandwidth/CPU usage.
```ini
Visibility.Distance.Continents = 100  # Retail ~100
Visibility.Distance.Instances = 170
Visibility.Distance.BGArenas = 250
```

### 7. Warden (Anti-Cheat)
Configuration for the built-in anti-cheat system.
```ini
Warden.Enabled = 1
Warden.ClientCheckFailAction = 0  # 0=Log, 1=Kick, 2=Ban
```

## Common "Where is X?" Guide

| Setting | Variable Name (Search for this) |
|---------|---------------------------------|
| **Max Players** | `PlayerLimit` |
| **Server Port** | `WorldServerPort` |
| **Expansion** | `Expansion` (0=Classic, 1=TBC, 2=WotLK) |
| **Resting XP** | `Rate.Rest.InGame`, `Rate.Rest.Offline` |
| **Skill Gain** | `Rate.Skill.Discovery`, `Rate.Skill.Gain` |
| **Fall Damage** | `Rate.Damage.Fall` |
| **Dungeon Finder** | `DungeonFinder.Options` |
| **Loot Trading** | `Allow.Loot.Trading` |
| **Respawn Speeds** | `Rate.Creature.Normal.Spawntime` |

## Best Practices

1.  **Never edit `.dist` files**: Always copy to `.conf` and edit used. This prevents conflict when you `git pull` updates.
2.  **Use `.conf` overrides**: AzerothCore allows split config files. You can create `worldserver.conf` that *only* contains the lines you changed. The server loads `.dist` first, then overrides with your `.conf`.
3.  **Reloading Configs**: Many (but not all) settings can be reloaded without restart:
    *   Ingame: `.reload config`
    *   Console: `reload config`
    *   *Note: Network and thread settings usually require a restart.*
4.  **Performance vs Gameplay**: High visibility distances and preloading maps improve gameplay but require better hardware. Start with defaults and tune up.

## Troubleshooting

-   **"Map file 'xxxx' is non-compatible version"**: Your `data/maps` folder does not match the core version. Re-run map extractors.
-   **"Unknown field in config"**: You likely updated the core but didn't update your `.conf` file to match the new `.dist` structure. Check the changelogs.
-   **Database connection errors**: Check username/password in `LoginDatabaseInfo` etc., and ensure MySQL is running and accessible on that port.

## Environment Variables (Docker)
If running via Docker, configuration can often be overridden by environment variables:
`AC_WORLDSERVER_CONFIG_SETTING_NAME=VALUE`
Example: `AC_WORLDSERVER_RATE_XP_KILL=5`
