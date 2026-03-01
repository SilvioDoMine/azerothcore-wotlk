---
name: AzerothCore Database Expert
description: Expert guidance for AzerothCore database schema, queries, and SQL operations across auth, characters, and world databases
---

# AzerothCore Database Expert Skill

Expert knowledge of AzerothCore's database structure and SQL patterns.

## Database Overview

| Database | Purpose |
|----------|---------|
| `acore_auth` | Account authentication, bans, realm info |
| `acore_characters` | Character data, guilds, mail, auctions |
| `acore_world` | Game templates, spawns, quests, items |

## Directory Structure

```
data/sql/
├── base/
│   ├── db_auth/           # Initial auth schema
│   ├── db_characters/     # Initial characters schema  
│   └── db_world/          # Initial world schema
├── updates/               # Incremental updates by date
└── custom/                # Your custom SQL
```

## Auth Database (`acore_auth`)

### Key Tables

#### `account`
```sql
`id` int(10) unsigned PRIMARY KEY,
`username` varchar(32) NOT NULL,
`sha_pass_hash` varchar(40) NOT NULL,
`email` varchar(254) NOT NULL DEFAULT '',
`expansion` tinyint(3) unsigned NOT NULL DEFAULT 2,  -- 0=Classic, 1=TBC, 2=WotLK
`mutetime` bigint(20) NOT NULL DEFAULT 0,
`locale` tinyint(3) unsigned NOT NULL DEFAULT 0,
`online` tinyint(3) unsigned NOT NULL DEFAULT 0
```

#### `account_access`
```sql
-- GM levels: 0=Player, 1=Moderator, 2=GameMaster, 3=Admin, 4=Console
`id` int(10) unsigned NOT NULL,
`gmlevel` tinyint(3) unsigned NOT NULL,
`RealmID` int(11) NOT NULL DEFAULT -1  -- -1 = all realms
```

#### `account_banned`
```sql
`id` int(10) unsigned NOT NULL,
`bandate` int(10) unsigned NOT NULL,
`unbandate` int(10) unsigned NOT NULL,
`bannedby` varchar(50) NOT NULL,
`banreason` varchar(255) NOT NULL,
`active` tinyint(3) unsigned NOT NULL DEFAULT 1
```

### Common Auth Queries

```sql
-- Create new account
INSERT INTO account (username, sha_pass_hash, email, reg_mail, expansion)
VALUES (UPPER('user'), SHA1(CONCAT(UPPER('user'), ':', UPPER('pass'))), 
        'email@example.com', 'email@example.com', 2);

-- Make GM
INSERT INTO account_access (id, gmlevel, RealmID)
SELECT id, 3, -1 FROM account WHERE username = 'MYACCOUNT';

-- Unban account
UPDATE account_banned SET active = 0 
WHERE id = (SELECT id FROM account WHERE username = 'USER');
```

## Characters Database (`acore_characters`)

### Key Tables

#### `characters`
```sql
`guid` int(10) unsigned PRIMARY KEY,
`account` int(10) unsigned NOT NULL,
`name` varchar(12) NOT NULL,
`race` tinyint(3) unsigned NOT NULL,
`class` tinyint(3) unsigned NOT NULL,
`level` tinyint(3) unsigned NOT NULL DEFAULT 1,
`money` int(10) unsigned NOT NULL DEFAULT 0,
`zone` smallint(5) unsigned NOT NULL DEFAULT 0,
`map` smallint(5) unsigned NOT NULL DEFAULT 0,
`position_x` float NOT NULL,
`position_y` float NOT NULL,
`position_z` float NOT NULL,
`online` tinyint(3) unsigned NOT NULL DEFAULT 0
```

#### `character_inventory`
```sql
`guid` int(10) unsigned NOT NULL,      -- character guid
`bag` int(10) unsigned NOT NULL DEFAULT 0,  -- 0 = equipped/backpack
`slot` tinyint(3) unsigned NOT NULL,
`item` int(10) unsigned NOT NULL       -- item_instance.guid
```

#### `item_instance`
```sql
`guid` int(10) unsigned PRIMARY KEY,
`itemEntry` mediumint(8) unsigned NOT NULL,
`owner_guid` int(10) unsigned NOT NULL,
`count` int(10) unsigned NOT NULL DEFAULT 1,
`durability` smallint(5) unsigned NOT NULL DEFAULT 0
```

#### `guild` and `guild_member`
```sql
-- guild
`guildid` int(10) unsigned PRIMARY KEY,
`name` varchar(24) NOT NULL,
`leaderguid` int(10) unsigned NOT NULL,
`BankMoney` bigint(20) unsigned NOT NULL DEFAULT 0

-- guild_member
`guildid` int(10) unsigned NOT NULL,
`guid` int(10) unsigned NOT NULL,
`rank` tinyint(3) unsigned NOT NULL
```

### Common Character Queries

```sql
-- Get character info
SELECT c.guid, c.name, c.level, c.class, c.race, c.money,
       a.username as account_name
FROM characters c
JOIN acore_auth.account a ON a.id = c.account
WHERE c.name = 'CharName';

-- Get guild members
SELECT c.name, c.level, gm.rank
FROM guild g
JOIN guild_member gm ON gm.guildid = g.guildid
JOIN characters c ON c.guid = gm.guid
WHERE g.name = 'My Guild'
ORDER BY gm.rank, c.level DESC;

-- Transfer gold
START TRANSACTION;
UPDATE characters SET money = money - 100000 WHERE name = 'Sender' AND money >= 100000;
UPDATE characters SET money = money + 100000 WHERE name = 'Receiver';
COMMIT;
```

## World Database (`acore_world`)

### Template Tables

#### `creature_template`
```sql
`entry` mediumint(8) unsigned PRIMARY KEY,
`name` varchar(100) NOT NULL DEFAULT '',
`minlevel` tinyint(3) unsigned NOT NULL DEFAULT 1,
`maxlevel` tinyint(3) unsigned NOT NULL DEFAULT 1,
`faction` smallint(5) unsigned NOT NULL DEFAULT 0,
`npcflag` int(10) unsigned NOT NULL DEFAULT 0,
`AIName` varchar(64) NOT NULL DEFAULT '',
`ScriptName` varchar(64) NOT NULL DEFAULT '',
`lootid` mediumint(8) unsigned NOT NULL DEFAULT 0
```

#### `item_template`
```sql
`entry` mediumint(8) unsigned PRIMARY KEY,
`class` tinyint(3) unsigned NOT NULL DEFAULT 0,
`subclass` tinyint(3) unsigned NOT NULL DEFAULT 0,
`name` varchar(255) NOT NULL DEFAULT '',
`Quality` tinyint(3) unsigned NOT NULL DEFAULT 0,
`BuyPrice` int(10) unsigned NOT NULL DEFAULT 0,
`SellPrice` int(10) unsigned NOT NULL DEFAULT 0,
`ItemLevel` smallint(5) unsigned NOT NULL DEFAULT 0,
`RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
`Stackable` int(11) NOT NULL DEFAULT 1
```

#### `quest_template`
```sql
`ID` mediumint(8) unsigned PRIMARY KEY,
`QuestLevel` smallint(6) NOT NULL DEFAULT 1,
`MinLevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
`LogTitle` varchar(255) DEFAULT NULL,
`RewardMoney` int(11) NOT NULL DEFAULT 0
```

### Spawn Tables

#### `creature`
```sql
`guid` int(10) unsigned PRIMARY KEY,
`id1` mediumint(8) unsigned NOT NULL,  -- creature_template.entry
`map` smallint(5) unsigned NOT NULL,
`position_x` float NOT NULL,
`position_y` float NOT NULL,
`position_z` float NOT NULL,
`spawntimesecs` int(10) unsigned NOT NULL DEFAULT 120
```

### Common World Queries

```sql
-- Find creature
SELECT entry, name, minlevel, maxlevel FROM creature_template
WHERE name LIKE '%Arthas%';

-- Find item
SELECT entry, name, Quality, ItemLevel FROM item_template
WHERE name LIKE '%Sword%' ORDER BY ItemLevel DESC LIMIT 20;

-- Spawn NPC
INSERT INTO creature (guid, id1, map, position_x, position_y, position_z, spawntimesecs)
VALUES ((SELECT MAX(guid)+1 FROM creature), 12345, 0, -8913.0, 555.0, 93.0, 120);

-- Add loot
INSERT INTO creature_loot_template (Entry, Item, Chance, MinCount, MaxCount)
VALUES (12345, 19019, 5.0, 1, 1);
```

## Enums Reference

### Item Quality
```
0=Poor(gray), 1=Common(white), 2=Uncommon(green), 3=Rare(blue), 
4=Epic(purple), 5=Legendary(orange), 6=Artifact, 7=Heirloom
```

### NPCFlags
```
0x01=GOSSIP, 0x02=QUESTGIVER, 0x80=VENDOR, 0x1000=REPAIR,
0x2000=FLIGHTMASTER, 0x10000=INNKEEPER, 0x20000=BANKER
```

### Classes
```
1=Warrior, 2=Paladin, 3=Hunter, 4=Rogue, 5=Priest, 
6=DeathKnight, 7=Shaman, 8=Mage, 9=Warlock, 11=Druid
```

### Races
```
1=Human, 2=Orc, 3=Dwarf, 4=NightElf, 5=Undead, 
6=Tauren, 7=Gnome, 8=Troll, 10=BloodElf, 11=Draenei
```

## Custom Tables for Modules

```sql
-- Example: modules/mod-mymodule/data/sql/db-characters/base/
CREATE TABLE `mod_custom_data` (
  `guid` INT UNSIGNED NOT NULL,
  `custom_value` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

## SQL Update Naming

Updates go in `data/sql/updates/` with format: `YYYY_MM_DD_N.sql`
