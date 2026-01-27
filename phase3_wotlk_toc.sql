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

-- 4.2 Configurar emblems - Opcional: converter Conquest para Triumph
-- Comportamento Blizzard Phase 3:
-- - Heroics dropam Triumph (ao invés de Conquest)
-- - ToC 10 dropa Triumph
-- - ToC 25 dropa Triumph

/*
UPDATE creature_loot_template
SET Item = 47241 -- Emblem of Triumph
WHERE Item = 45624 -- Emblem of Conquest
AND Entry IN (
    SELECT entry FROM creature_template
    WHERE rank = 1 -- Dungeon bosses
);
*/

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
