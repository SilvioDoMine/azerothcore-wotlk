-- ============================================================================
-- PROGRESSÃO PARA PHASE 3 WOTLK - TRIAL OF THE CRUSADER
-- ============================================================================
-- Execute este script APÓS ter configurado Phase 2
-- Adiciona: ToC, Trial of the Champion, Onyxia 80, Argent Tournament, Season 7
-- ============================================================================

-- ============================================================================
-- PARTE 1: PVP - ATIVAR SEASON 7
-- ============================================================================

-- 1.1 Ativar Arena Season 7 (Relentless Gladiator)
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2030-12-31 23:59:59' WHERE eventEntry = 59;

-- ============================================================================
-- PARTE 2: HABILITAR TRIAL OF THE CRUSADER
-- ============================================================================

-- 2.1 Remover ToC da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 649;

-- 2.2 Restaurar NPCs de entrada ToC (reimportar do backup)
/*
INSERT INTO creature ...
WHERE id1 IN (34816, 35766, 35153, 34564);
*/

-- ============================================================================
-- PARTE 3: HABILITAR TRIAL OF THE CHAMPION (Dungeon)
-- ============================================================================

-- 3.1 Remover Trial of the Champion da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 650;

-- 3.2 Restaurar NPCs de entrada (reimportar do backup)
/*
INSERT INTO creature ...
WHERE id1 IN (35004, 34996, 35005, 35008, 35028, 35029);
*/

-- ============================================================================
-- PARTE 4: EMBLEM OF TRIUMPH
-- ============================================================================

-- 4.1 Restaurar vendors de Emblem of Triumph
/*
INSERT INTO creature ...
WHERE id1 IN (35573, 35494, 35574, 35495);
*/

-- 4.2 Comportamento Blizzard Phase 3 (Patch 3.2):
-- - Heroics dropam Triumph (já é o padrão do AzerothCore)
-- - ToC 10/25 dropa Triumph
-- - Ulduar continua dropando Conquest
-- - Naxx/OS/VoA continuam dropando Heroism/Valor

-- 4.3 Remover Emblem of Heroism adicionados na Phase 1 (volta ao padrão AC = Triumph)
DELETE FROM creature_loot_template WHERE Item = 40752 AND Entry IN (
    -- Heroic Dungeons
    29932, 30397, 30398, 30510, 30529, 30530, 30532, 30540, 30748, 30774,
    30788, 30807, 30810, 31211, 31212, 31215, 31349, 31350, 31360, 31362,
    31367, 31368, 31370, 31381, 31384, 31386, 31456, 31463, 31464, 31465,
    31469, 31506, 31507, 31508, 31509, 31510, 31511, 31512, 31533, 31536,
    31537, 31538, 31558, 31559, 31560, 31610, 31611, 31612, 31656, 31673,
    31679, 32313
);

-- 4.4 Remover Emblem of Heroism/Valor dos raids Phase 1 (será substituído por Triumph)
DELETE FROM creature_loot_template WHERE Item IN (40752, 40753) AND Entry IN (
    -- Naxxramas 10-man
    15956, 15953, 15952, 15954, 15936, 16011, 16061, 16060, 16028, 15931,
    15932, 15928, 15989, 15990, 28860, 31125,
    -- Naxxramas 25-man
    29249, 29268, 29278, 29615, 29701, 29718, 29940, 29955, 29324, 29373,
    29417, 29448, 29991, 30061, 31311, 31722
);

-- 4.5 Remover Emblem of Conquest de Ulduar (substituir por Triumph)
DELETE FROM creature_loot_template WHERE Item = 45624 AND Entry IN (
    -- Ulduar 10-man
    33113, 33118, 33186, 33293, 32867, 32927, 32857, 32930, 33515, 32845,
    32865, 32906, 33350, 33271, 33288, 32871,
    -- Ulduar 25-man
    33190, 33724, 33885, 33693, 33692, 33694, 34175, 33449, 33955,
    -- Emalon
    33993, 33994
);

-- 4.6 Adicionar Emblem of Triumph para raids antigas (comportamento 3.2+)
-- Naxx, OS, VoA, Ulduar todos dropam Triumph agora
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
-- Naxxramas 10-man
(15956, 47241, 0, 100, 0, 1, 0, 1, 1, 'Anub\'Rekhan - Emblem of Triumph'),
(15953, 47241, 0, 100, 0, 1, 0, 1, 1, 'Grand Widow Faerlina - Emblem of Triumph'),
(15952, 47241, 0, 100, 0, 1, 0, 1, 1, 'Maexxna - Emblem of Triumph'),
(15954, 47241, 0, 100, 0, 1, 0, 1, 1, 'Noth the Plaguebringer - Emblem of Triumph'),
(15936, 47241, 0, 100, 0, 1, 0, 1, 1, 'Heigan the Unclean - Emblem of Triumph'),
(16011, 47241, 0, 100, 0, 1, 0, 1, 1, 'Loatheb - Emblem of Triumph'),
(16061, 47241, 0, 100, 0, 1, 0, 1, 1, 'Instructor Razuvious - Emblem of Triumph'),
(16060, 47241, 0, 100, 0, 1, 0, 1, 1, 'Gothik the Harvester - Emblem of Triumph'),
(16028, 47241, 0, 100, 0, 1, 0, 1, 1, 'Patchwerk - Emblem of Triumph'),
(15931, 47241, 0, 100, 0, 1, 0, 1, 1, 'Grobbulus - Emblem of Triumph'),
(15932, 47241, 0, 100, 0, 1, 0, 1, 1, 'Gluth - Emblem of Triumph'),
(15928, 47241, 0, 100, 0, 1, 0, 1, 1, 'Thaddius - Emblem of Triumph'),
(15989, 47241, 0, 100, 0, 1, 0, 1, 1, 'Sapphiron - Emblem of Triumph'),
(15990, 47241, 0, 100, 0, 1, 0, 2, 2, 'Kel\'Thuzad - Emblem of Triumph'),
(28860, 47241, 0, 100, 0, 1, 0, 1, 1, 'Sartharion - Emblem of Triumph'),
(31125, 47241, 0, 100, 0, 1, 0, 2, 2, 'Archavon the Stone Watcher - Emblem of Triumph'),
-- Naxxramas 25-man
(29249, 47241, 0, 100, 0, 1, 0, 1, 1, 'Anub\'Rekhan (1) - Emblem of Triumph'),
(29268, 47241, 0, 100, 0, 1, 0, 1, 1, 'Grand Widow Faerlina (1) - Emblem of Triumph'),
(29278, 47241, 0, 100, 0, 1, 0, 1, 1, 'Maexxna (1) - Emblem of Triumph'),
(29615, 47241, 0, 100, 0, 1, 0, 1, 1, 'Noth the Plaguebringer (1) - Emblem of Triumph'),
(29701, 47241, 0, 100, 0, 1, 0, 1, 1, 'Heigan the Unclean (1) - Emblem of Triumph'),
(29718, 47241, 0, 100, 0, 1, 0, 1, 1, 'Loatheb (1) - Emblem of Triumph'),
(29940, 47241, 0, 100, 0, 1, 0, 1, 1, 'Instructor Razuvious (1) - Emblem of Triumph'),
(29955, 47241, 0, 100, 0, 1, 0, 1, 1, 'Gothik the Harvester (1) - Emblem of Triumph'),
(29324, 47241, 0, 100, 0, 1, 0, 1, 1, 'Patchwerk (1) - Emblem of Triumph'),
(29373, 47241, 0, 100, 0, 1, 0, 1, 1, 'Grobbulus (1) - Emblem of Triumph'),
(29417, 47241, 0, 100, 0, 1, 0, 1, 1, 'Gluth (1) - Emblem of Triumph'),
(29448, 47241, 0, 100, 0, 1, 0, 1, 1, 'Thaddius (1) - Emblem of Triumph'),
(29991, 47241, 0, 100, 0, 1, 0, 1, 1, 'Sapphiron (1) - Emblem of Triumph'),
(30061, 47241, 0, 100, 0, 1, 0, 2, 2, 'Kel\'Thuzad (1) - Emblem of Triumph'),
(31311, 47241, 0, 100, 0, 1, 0, 1, 1, 'Sartharion (1) - Emblem of Triumph'),
(31722, 47241, 0, 100, 0, 1, 0, 2, 2, 'Archavon the Stone Watcher (1) - Emblem of Triumph'),
-- Emalon (VoA Phase 2 boss)
(33993, 47241, 0, 100, 0, 1, 0, 2, 2, 'Emalon the Storm Watcher - Emblem of Triumph'),
(33994, 47241, 0, 100, 0, 1, 0, 2, 2, 'Emalon the Storm Watcher (1) - Emblem of Triumph');

-- 4.7 Adicionar Koralon the Flame Watcher ao VoA (Phase 3 boss)
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(35013, 47241, 0, 100, 0, 1, 0, 2, 2, 'Koralon the Flame Watcher - Emblem of Triumph'),
(35360, 47241, 0, 100, 0, 1, 0, 2, 2, 'Koralon the Flame Watcher (1) - Emblem of Triumph');

-- 4.8 Adicionar Trial of the Champion (dungeon) bosses - Triumph
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(35119, 47241, 0, 100, 0, 1, 0, 1, 1, 'Eadric the Pure (1) - Emblem of Triumph'),
(34928, 47241, 0, 100, 0, 1, 0, 1, 1, 'Argent Confessor Paletress (1) - Emblem of Triumph'),
(35451, 47241, 0, 100, 0, 1, 0, 1, 1, 'The Black Knight - Emblem of Triumph'),
(35490, 47241, 0, 100, 0, 1, 0, 1, 1, 'The Black Knight (1) - Emblem of Triumph');

-- ============================================================================
-- PARTE 5: ARGENT TOURNAMENT
-- ============================================================================

-- 5.1 Restaurar Dame Evniki Kapsalis
/*
INSERT INTO creature ...
WHERE id1 = 34885;
*/

-- 5.2 Restaurar outros NPCs do Torneio (reimportar do backup)
/*
INSERT INTO creature ...
WHERE id1 IN (33817, 33759, 33379, 33738, 33225, 33849, 33592, 33593, 33448, 33657, 33690);
*/

-- 5.3 Reativar Quests do Argent Tournament
UPDATE quest_template SET AllowableRaces = 1791 WHERE ID IN (
    -- Aspirant Quests
    13667, 13668, 13669, 13670, 13671, 13672, 13673, 13674, 13675,
    -- Valiant Quests
    13676, 13677, 13678, 13679, 13680, 13681, 13682, 13683, 13684,
    -- Champion Quests
    13686, 13687, 13688, 13689, 13690, 13691, 13692, 13693, 13694,
    -- Crusader Quests
    13795, 13796, 13797, 13798, 13799, 13800, 13801, 13802, 13803,
    -- Daily Quests do Torneio
    13684, 13685, 13756, 13757, 13758, 13759, 13760, 13761, 13762,
    13763, 13764, 13765, 13766, 13767, 13768, 13769, 13770, 13771,
    13772, 13773, 13774, 13775, 13776, 13777, 13778, 13779, 13780,
    13781, 13782, 13783, 13784, 13785, 13786, 13787, 13788, 13789,
    -- Black Knight chain
    13633, 13634, 13635, 13636, 13637, 13638, 13639, 13640, 13641
);

-- 5.4 Restaurar heirlooms do Argent Tournament nos vendors
/*
INSERT INTO npc_vendor ...
WHERE entry = 34885 AND item IN (42943, 42944, ...);
*/

-- ============================================================================
-- PARTE 6: TIER 9 VENDORS
-- ============================================================================

-- 6.1 Restaurar vendors T9 (reimportar do backup)
/*
INSERT INTO creature ...
WHERE id1 IN (35579, 35580, 35576, 35575, 35578, 35577);
*/

-- ============================================================================
-- PARTE 7: ONYXIA LEVEL 80
-- ============================================================================

-- 7.1 Onyxia 80 já deve estar disponível no AzerothCore por padrão
-- O conteúdo foi relançado na Phase 3 junto com o 5º aniversário do WoW

-- Verificar se Onyxia está configurada corretamente:
SELECT entry, name, minlevel, maxlevel, difficulty_entry_1
FROM creature_template
WHERE entry = 10184;

-- ============================================================================
-- PARTE 8: QUESTS PHASE 3
-- ============================================================================

-- 8.1 Reativar quests do Trial of the Crusader
UPDATE quest_template SET AllowableRaces = 1791 WHERE ID IN (
    14178, 14179, 14180, 14181, 14182,
    14145, 14146, 14147, 14148, 14149, 14150
);

-- ============================================================================
-- PARTE 9: PROFISSÕES PHASE 3
-- ============================================================================

-- 9.1 Crusader Orbs começam a dropar em ToC
-- Receitas que usam Crusader Orbs agora são relevantes

-- 9.2 Restaurar receitas de ToC nos loot tables (reimportar do backup)

SELECT 'Progressão para Phase 3 (Trial of the Crusader) aplicada!' AS Status;
