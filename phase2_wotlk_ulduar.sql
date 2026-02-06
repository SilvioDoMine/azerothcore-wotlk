-- ============================================================================
-- PROGRESSÃO PARA PHASE 2 WOTLK - ULDUAR
-- ============================================================================
-- Execute este script APÓS ter configurado Phase 1
-- Adiciona: Ulduar, Season 6, Emblem of Conquest, T8
-- ============================================================================

-- ============================================================================
-- PARTE 1: PVP - ATIVAR SEASON 6
-- ============================================================================

-- 1.1 Ativar Arena Season 6 (Furious Gladiator)
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2030-12-31 23:59:59' WHERE eventEntry = 58;

-- 1.2 Restaurar itens Furious Gladiator nos vendors
-- Isto requer reimportar os dados originais ou restaurar do backup
-- Alternativa: executar o SQL original do AzerothCore para npc_vendor

-- ============================================================================
-- PARTE 2: HABILITAR ULDUAR
-- ============================================================================

-- 2.1 Remover Ulduar da lista de disables
DELETE FROM disables WHERE sourceType = 2 AND entry = 603;

-- 2.2 Restaurar NPCs de Ulduar
-- Os NPCs devem ser reimportados do backup ou do SQL original
-- Exemplo para Lore Keeper of Norgannon:
/*
INSERT INTO creature (guid, id1, map, position_x, position_y, position_z, orientation) VALUES
(XXXXXX, 33957, 603, XXXX, XXXX, XXXX, X.XXX);
*/

-- 2.3 Restaurar portal de Ulduar em Dalaran
-- INSERT INTO gameobject ... (do backup original)

-- ============================================================================
-- PARTE 3: EMBLEM OF CONQUEST
-- ============================================================================

-- 3.1 Restaurar vendors de Emblem of Conquest
-- Arcanist Firael (Alliance) e Magister Sarien (Horde)
-- Reimportar do backup:
/*
INSERT INTO creature (guid, id1, map, position_x, position_y, position_z, orientation)
SELECT * FROM backup_creature WHERE id1 IN (33964, 33963);
*/

-- 3.2 Remover emblemas de Phase 1 dos bosses de raid (serão substituídos por Conquest)
-- Naxx + OS + VoA continuam dropando emblemas antigos (Heroism/Valor)
-- Apenas Ulduar dropa Conquest

-- 3.3 Adicionar Emblem of Conquest para Ulduar bosses
-- Ulduar 10-man e 25-man ambos dropam Conquest
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
-- Ulduar 10-man
(33113, 45624, 0, 100, 0, 1, 0, 1, 1, 'Flame Leviathan - Emblem of Conquest'),
(33118, 45624, 0, 100, 0, 1, 0, 1, 1, 'Ignis the Furnace Master - Emblem of Conquest'),
(33186, 45624, 0, 100, 0, 1, 0, 1, 1, 'Razorscale - Emblem of Conquest'),
(33293, 45624, 0, 100, 0, 1, 0, 1, 1, 'XT-002 Deconstructor - Emblem of Conquest'),
(32867, 45624, 0, 100, 0, 1, 0, 1, 1, 'Steelbreaker - Emblem of Conquest'),
(32927, 45624, 0, 100, 0, 1, 0, 1, 1, 'Runemaster Molgeim - Emblem of Conquest'),
(32857, 45624, 0, 100, 0, 1, 0, 1, 1, 'Stormcaller Brundir - Emblem of Conquest'),
(32930, 45624, 0, 100, 0, 1, 0, 1, 1, 'Kologarn - Emblem of Conquest'),
(33515, 45624, 0, 100, 0, 1, 0, 1, 1, 'Auriaya - Emblem of Conquest'),
(32845, 45624, 0, 100, 0, 1, 0, 1, 1, 'Hodir - Emblem of Conquest'),
(32865, 45624, 0, 100, 0, 1, 0, 1, 1, 'Thorim - Emblem of Conquest'),
(32906, 45624, 0, 100, 0, 1, 0, 1, 1, 'Freya - Emblem of Conquest'),
(33350, 45624, 0, 100, 0, 1, 0, 1, 1, 'Mimiron - Emblem of Conquest'),
(33271, 45624, 0, 100, 0, 1, 0, 1, 1, 'General Vezax - Emblem of Conquest'),
(33288, 45624, 0, 100, 0, 1, 0, 2, 2, 'Yogg-Saron - Emblem of Conquest'),
(32871, 45624, 0, 100, 0, 1, 0, 2, 2, 'Algalon the Observer - Emblem of Conquest'),
-- Ulduar 25-man
(33113, 45624, 0, 100, 0, 2, 0, 1, 1, 'Flame Leviathan (25) - Emblem of Conquest'),
(33190, 45624, 0, 100, 0, 1, 0, 1, 1, 'Ignis the Furnace Master (1) - Emblem of Conquest'),
(33724, 45624, 0, 100, 0, 1, 0, 1, 1, 'Razorscale (1) - Emblem of Conquest'),
(33885, 45624, 0, 100, 0, 1, 0, 1, 1, 'XT-002 Deconstructor (1) - Emblem of Conquest'),
(33693, 45624, 0, 100, 0, 1, 0, 1, 1, 'Steelbreaker (1) - Emblem of Conquest'),
(33692, 45624, 0, 100, 0, 1, 0, 1, 1, 'Runemaster Molgeim (1) - Emblem of Conquest'),
(33694, 45624, 0, 100, 0, 1, 0, 1, 1, 'Stormcaller Brundir (1) - Emblem of Conquest'),
(34175, 45624, 0, 100, 0, 1, 0, 1, 1, 'Auriaya (1) - Emblem of Conquest'),
(33449, 45624, 0, 100, 0, 1, 0, 1, 1, 'General Vezax (1) - Emblem of Conquest'),
(33955, 45624, 0, 100, 0, 1, 0, 2, 2, 'Yogg-Saron (1) - Emblem of Conquest');

-- 3.4 Adicionar Emalon the Storm Watcher ao VoA (Phase 2 boss)
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(33993, 45624, 0, 100, 0, 1, 0, 2, 2, 'Emalon the Storm Watcher - Emblem of Conquest'),
(33994, 45624, 0, 100, 0, 1, 0, 2, 2, 'Emalon the Storm Watcher (1) - Emblem of Conquest');

-- ============================================================================
-- PARTE 4: TIER 8 VENDORS
-- ============================================================================

-- 4.1 Restaurar vendors T8 (reimportar do backup)
/*
INSERT INTO creature (guid, id1, map, position_x, position_y, position_z, orientation)
SELECT * FROM backup_creature WHERE id1 IN (29523, 34252, 28995, 28992);
*/

-- ============================================================================
-- PARTE 5: QUESTS DE ULDUAR
-- ============================================================================

-- 5.1 Reativar quests de Ulduar
UPDATE quest_template SET AllowableRaces = 1791 WHERE ID IN (
    13604, 13605, 13606, 13607, 13608, 13609, 13610,
    13816, 13817, 13818,
    13380, 13381, 13382, 13383, 13384, 13385
);

-- ============================================================================
-- PARTE 6: PROFISSÕES PHASE 2
-- ============================================================================

-- 6.1 Restaurar receitas de Ulduar nos loot tables
-- Isto requer reimportar do backup ou do SQL original

-- 6.2 Habilitar crafting de itens ilvl 226-239

-- ============================================================================
-- PARTE 7: ITEMS ESPECIAIS PHASE 2
-- ============================================================================

-- 7.1 Restaurar Val'anyr fragments no loot
-- Reimportar creature_loot_template para Fragment of Val'anyr (45038)

-- 7.2 Restaurar Mimiron's Head no loot (0-man hard mode)
-- Reimportar creature_loot_template

SELECT 'Progressão para Phase 2 (Ulduar) aplicada!' AS Status;
SELECT 'Alguns NPCs/Items podem precisar ser reimportados do backup.' AS Aviso;
