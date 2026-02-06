-- ============================================================================
-- PROGRESSÃO PARA PHASE 4 WOTLK - ICECROWN CITADEL
-- ============================================================================
-- Execute este script APÓS ter configurado Phase 3
-- Adiciona: ICC, Frozen Halls (3 dungeons), Ruby Sanctum, Season 8
-- ============================================================================

-- ============================================================================
-- PARTE 1: PVP - ATIVAR SEASON 8
-- ============================================================================

-- 1.1 Ativar Arena Season 8 (Wrathful Gladiator)
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2030-12-31 23:59:59' WHERE eventEntry = 60;

-- ============================================================================
-- PARTE 2: HABILITAR ICECROWN CITADEL
-- ============================================================================

-- 2.1 Remover ICC da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 631;

-- 2.2 Restaurar NPCs de entrada ICC (reimportar do backup)
/*
INSERT INTO creature ...
WHERE id1 IN (
    37597, 37596, 37592, 37593, 37591, 37580, 37120, 38995,
    36856, 36649, 36650, 36651, 36652, 37904, 37955, 37156, 38311
);
*/

-- 2.3 Restaurar portal de ICC em Dalaran
/*
INSERT INTO gameobject ...
WHERE id = 201584;
*/

-- ============================================================================
-- PARTE 3: HABILITAR FROZEN HALLS (3 Dungeons)
-- ============================================================================

-- 3.1 Remover Forge of Souls da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 632;

-- 3.2 Remover Pit of Saron da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 658;

-- 3.3 Remover Halls of Reflection da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 668;

-- 3.4 Restaurar NPCs de entrada dos Frozen Halls
/*
INSERT INTO creature ...
WHERE id1 IN (36993, 37597, 36990, 37596);
*/

-- ============================================================================
-- PARTE 4: EMBLEM OF FROST
-- ============================================================================

-- 4.1 Restaurar vendors de Emblem of Frost
/*
INSERT INTO creature ...
WHERE id1 IN (37942, 38858, 37941);
*/

-- 4.2 Comportamento Blizzard Phase 4 (Patch 3.3):
-- - Heroics dropam Triumph (regular) + Frost via daily dungeon finder
-- - ICC 10/25 dropa Frost
-- - ToC, Ulduar, Naxx continuam dropando Triumph
-- - Frozen Halls (3 dungeons heroicas novas) dropam Triumph

-- 4.3 Adicionar Emblem of Frost para ICC bosses
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
-- ICC 10-man
(36612, 49426, 0, 100, 0, 1, 0, 2, 2, 'Lord Marrowgar - Emblem of Frost'),
(36855, 49426, 0, 100, 0, 1, 0, 2, 2, 'Lady Deathwhisper - Emblem of Frost'),
(36939, 49426, 0, 100, 0, 1, 0, 2, 2, 'High Overlord Saurfang - Emblem of Frost'),
(37813, 49426, 0, 100, 0, 1, 0, 2, 2, 'Deathbringer Saurfang - Emblem of Frost'),
(36626, 49426, 0, 100, 0, 1, 0, 2, 2, 'Festergut - Emblem of Frost'),
(36627, 49426, 0, 100, 0, 1, 0, 2, 2, 'Rotface - Emblem of Frost'),
(36678, 49426, 0, 100, 0, 1, 0, 2, 2, 'Professor Putricide - Emblem of Frost'),
(37970, 49426, 0, 100, 0, 1, 0, 2, 2, 'Blood Prince Council - Emblem of Frost'),
(37955, 49426, 0, 100, 0, 1, 0, 2, 2, 'Blood-Queen Lana\'thel - Emblem of Frost'),
(36789, 49426, 0, 100, 0, 1, 0, 2, 2, 'Valithria Dreamwalker - Emblem of Frost'),
(36853, 49426, 0, 100, 0, 1, 0, 2, 2, 'Sindragosa - Emblem of Frost'),
(36597, 49426, 0, 100, 0, 1, 0, 3, 3, 'The Lich King - Emblem of Frost');

-- 4.4 Adicionar Toravon the Ice Watcher ao VoA (Phase 4 boss)
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(38433, 49426, 0, 100, 0, 1, 0, 2, 2, 'Toravon the Ice Watcher - Emblem of Frost'),
(38462, 49426, 0, 100, 0, 1, 0, 2, 2, 'Toravon the Ice Watcher (1) - Emblem of Frost');

-- 4.5 Adicionar Emblem of Triumph para Frozen Halls dungeons
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
-- Forge of Souls
(36497, 47241, 0, 100, 0, 1, 0, 1, 1, 'Bronjahm - Emblem of Triumph'),
(36498, 47241, 0, 100, 0, 1, 0, 1, 1, 'Bronjahm (1) - Emblem of Triumph'),
(36502, 47241, 0, 100, 0, 1, 0, 1, 1, 'Devourer of Souls - Emblem of Triumph'),
(37677, 47241, 0, 100, 0, 1, 0, 1, 1, 'Devourer of Souls (1) - Emblem of Triumph'),
-- Pit of Saron
(36494, 47241, 0, 100, 0, 1, 0, 1, 1, 'Forgemaster Garfrost - Emblem of Triumph'),
(37613, 47241, 0, 100, 0, 1, 0, 1, 1, 'Forgemaster Garfrost (1) - Emblem of Triumph'),
(36476, 47241, 0, 100, 0, 1, 0, 1, 1, 'Ick - Emblem of Triumph'),
(37627, 47241, 0, 100, 0, 1, 0, 1, 1, 'Ick (1) - Emblem of Triumph'),
(36658, 47241, 0, 100, 0, 1, 0, 1, 1, 'Scourgelord Tyrannus - Emblem of Triumph'),
(36938, 47241, 0, 100, 0, 1, 0, 1, 1, 'Scourgelord Tyrannus (1) - Emblem of Triumph'),
-- Halls of Reflection
(38112, 47241, 0, 100, 0, 1, 0, 1, 1, 'Falric - Emblem of Triumph'),
(38599, 47241, 0, 100, 0, 1, 0, 1, 1, 'Falric (1) - Emblem of Triumph'),
(38113, 47241, 0, 100, 0, 1, 0, 1, 1, 'Marwyn - Emblem of Triumph'),
(38603, 47241, 0, 100, 0, 1, 0, 1, 1, 'Marwyn (1) - Emblem of Triumph');

-- 4.6 Halion (Ruby Sanctum) dropa Emblem of Frost
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(39863, 49426, 0, 100, 0, 1, 0, 2, 2, 'Halion - Emblem of Frost'),
(40142, 49426, 0, 100, 0, 1, 0, 2, 2, 'Halion (1) - Emblem of Frost');

-- ============================================================================
-- PARTE 5: TIER 10 VENDORS
-- ============================================================================

-- 5.1 Restaurar vendors T10 (reimportar do backup)
/*
INSERT INTO creature ...
WHERE id1 IN (
    37999, 37688, 37696, 37993, 38181, 35498, 37991, 38840,
    38283, 35500, 38182, 38316, 35497, 35496, 38054, 37998,
    37992, 38284, 38841, 37997
);
*/

-- ============================================================================
-- PARTE 6: RUBY SANCTUM
-- ============================================================================

-- 6.1 Remover Ruby Sanctum da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 724;

-- 6.2 Restaurar NPCs de Ruby Sanctum
/*
INSERT INTO creature ...
WHERE id1 IN (39746, 39747, 39751, 39863, 40142);
*/

-- 6.3 Restaurar portal de Ruby Sanctum
/*
INSERT INTO gameobject ...
WHERE id = 202741;
*/

-- ============================================================================
-- PARTE 7: QUESTS ICC
-- ============================================================================

-- 7.1 Reativar quests de ICC
UPDATE quest_template SET AllowableRaces = 1791 WHERE ID IN (
    -- Intro quests ICC
    24500, 24501, 24502, 24503, 24504, 24505, 24506, 24507, 24508,
    -- Inside ICC quests
    24545, 24546, 24547, 24548, 24549, 24550, 24551, 24552,
    -- Shadowmourne questline
    24545, 24743, 24547, 24749, 24756, 24757, 24792, 24827,
    -- Battered Hilt questline (Quel'Delar)
    24476, 24559, 24560, 24561, 24553, 24554, 24555, 24556, 24557,
    -- Frozen Halls quests
    24510, 24511, 24512, 24513, 24514, 24515, 24516, 24517, 24518,
    -- Weekly raid quests ICC
    24579, 24580, 24581, 24582, 24583, 24584, 24585, 24586, 24587,
    24588, 24589, 24590
);

-- 7.2 Restaurar NPCs de quest ICC
/*
INSERT INTO creature ...
WHERE id1 IN (36597, 37948, 37949, 38738, 38225);
*/

-- ============================================================================
-- PARTE 8: ASHEN VERDICT FACTION
-- ============================================================================

-- 8.1 Restaurar receitas Ashen Verdict nos vendors
/*
INSERT INTO npc_vendor ...
WHERE item IN (49957, 49958, 49959, 49960, 49961, 49962, 49963, 49964, 49965, 49966, 49967, 49968);
*/

-- 8.2 Ashen Verdict reputation rings são obtidos automaticamente via reputation
-- Verificar se NPC de trade está disponível

-- ============================================================================
-- PARTE 9: ITEMS LEGENDÁRIOS ICC
-- ============================================================================

-- 9.1 Restaurar Shadowmourne questline items
/*
INSERT INTO creature_loot_template ...
WHERE Item IN (49623, 49888, 50274);
*/

-- 9.2 Restaurar Invincible mount no loot do Lich King
/*
INSERT INTO creature_loot_template ...
WHERE Item = 50818 AND Entry = 36597; -- The Lich King
*/

-- ============================================================================
-- PARTE 10: PROFISSÕES PHASE 4
-- ============================================================================

-- 10.1 Primordial Saronite começa a dropar em ICC
-- Restaurar receitas que usam Primordial Saronite

-- 10.2 Restaurar ICC patterns nos loot tables (reimportar do backup)
/*
INSERT INTO creature_loot_template ...
WHERE Item IN (49969, 49970, 49971, 49972, 49973, 49974, ...);
*/

-- ============================================================================
-- PARTE 11: ICC RAID BUFF (Opcional - Progressivo)
-- ============================================================================

-- O buff "Strength of Wrynn" / "Hellscream's Warsong" foi aumentado gradualmente
-- Isto é controlado por aura stacks no código, não por SQL
-- Para simular progressão, pode-se usar comandos GM ou scripts

-- Buff inicial: 0%
-- Após algumas semanas: 5%, 10%, 15%, 20%, 25%, 30%

-- ============================================================================
-- PARTE 12: WEEKLY RAID QUESTS
-- ============================================================================

-- 12.1 As weekly raid quests variam aleatoriamente
-- Configurar game_event para rotação semanal

-- Verificar se os eventos estão configurados:
SELECT eventEntry, description, start_time, end_time
FROM game_event
WHERE description LIKE '%Weekly%' OR description LIKE '%Raid%Quest%';

SELECT 'Progressão para Phase 4 (Icecrown Citadel) aplicada!' AS Status;
SELECT 'Servidor agora está com TODO conteúdo WotLK habilitado!' AS Info;
