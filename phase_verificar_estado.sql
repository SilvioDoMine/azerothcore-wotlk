-- ============================================================================
-- VERIFICAÇÃO DE ESTADO DAS PHASES - WOTLK AZEROTHCORE
-- ============================================================================
-- Execute este script para ver qual phase está configurada no servidor
-- ============================================================================

SELECT '========================================' AS '';
SELECT '  VERIFICAÇÃO DE PHASES - WOTLK' AS '';
SELECT '========================================' AS '';

-- ============================================================================
-- 1. ARENA SEASONS
-- ============================================================================
SELECT '' AS '';
SELECT '--- ARENA SEASONS ---' AS '';

SELECT
    eventEntry AS 'Event',
    description AS 'Descrição',
    CASE
        WHEN NOW() BETWEEN start_time AND end_time THEN '✅ ATIVO'
        ELSE '❌ INATIVO'
    END AS 'Status',
    CASE eventEntry
        WHEN 57 THEN 'Phase 1'
        WHEN 58 THEN 'Phase 2'
        WHEN 59 THEN 'Phase 3'
        WHEN 60 THEN 'Phase 4'
    END AS 'Phase'
FROM game_event
WHERE eventEntry IN (57, 58, 59, 60)
ORDER BY eventEntry;

-- ============================================================================
-- 2. RAIDS/DUNGEONS BLOQUEADAS
-- ============================================================================
SELECT '' AS '';
SELECT '--- RAIDS/DUNGEONS BLOQUEADAS ---' AS '';

SELECT
    entry AS 'Map ID',
    comment AS 'Descrição',
    CASE entry
        WHEN 603 THEN 'Ulduar (Phase 2)'
        WHEN 649 THEN 'Trial of the Crusader (Phase 3)'
        WHEN 650 THEN 'Trial of the Champion (Phase 3)'
        WHEN 631 THEN 'Icecrown Citadel (Phase 4)'
        WHEN 632 THEN 'Forge of Souls (Phase 4)'
        WHEN 658 THEN 'Pit of Saron (Phase 4)'
        WHEN 668 THEN 'Halls of Reflection (Phase 4)'
        WHEN 724 THEN 'Ruby Sanctum (Phase 4)'
        ELSE 'Outro'
    END AS 'Conteúdo'
FROM disables
WHERE sourceType = 2
AND entry IN (603, 649, 650, 631, 632, 658, 668, 724);

SELECT
    CASE
        WHEN COUNT(*) = 0 THEN '✅ Nenhuma raid/dungeon de phase futura bloqueada (Full Content)'
        WHEN COUNT(*) >= 6 THEN '📦 Phase 1 detectada (múltiplas instâncias bloqueadas)'
        ELSE CONCAT('⚠️ ', COUNT(*), ' instâncias bloqueadas')
    END AS 'Resultado'
FROM disables
WHERE sourceType = 2
AND entry IN (603, 649, 650, 631, 632, 658, 668, 724);

-- ============================================================================
-- 3. VENDORS DE EMBLEMS
-- ============================================================================
SELECT '' AS '';
SELECT '--- VENDORS DE EMBLEMS SPAWNED ---' AS '';

SELECT
    ct.entry AS 'Entry',
    ct.name AS 'Nome',
    CASE
        WHEN ct.entry IN (31580, 31582, 31579, 31581) THEN 'Phase 1 (Heroism/Valor)'
        WHEN ct.entry IN (33964, 33963) THEN 'Phase 2 (Conquest)'
        WHEN ct.entry IN (35573, 35494, 35574, 35495) THEN 'Phase 3 (Triumph)'
        WHEN ct.entry IN (37942, 38858, 37941) THEN 'Phase 4 (Frost)'
    END AS 'Phase',
    CASE WHEN c.guid IS NOT NULL THEN '✅ Spawned' ELSE '❌ Removido' END AS 'Status'
FROM creature_template ct
LEFT JOIN creature c ON c.id1 = ct.entry
WHERE ct.entry IN (
    31580, 31582, 31579, 31581,  -- Phase 1
    33964, 33963,                -- Phase 2
    35573, 35494, 35574, 35495,  -- Phase 3
    37942, 38858, 37941          -- Phase 4
)
GROUP BY ct.entry
ORDER BY ct.entry;

-- ============================================================================
-- 4. ITENS PVP POR SEASON NO BANCO
-- ============================================================================
SELECT '' AS '';
SELECT '--- ITENS PVP NOS VENDORS ---' AS '';

SELECT
    CASE
        WHEN it.name LIKE '%Savage%Gladiator%' THEN 'S5 - Savage (Craft)'
        WHEN it.name LIKE '%Hateful%Gladiator%' THEN 'S5 - Hateful (Honor)'
        WHEN it.name LIKE '%Deadly%Gladiator%' THEN 'S5 - Deadly (Arena)'
        WHEN it.name LIKE '%Furious%Gladiator%' THEN 'S6 - Furious'
        WHEN it.name LIKE '%Relentless%Gladiator%' THEN 'S7 - Relentless'
        WHEN it.name LIKE '%Wrathful%Gladiator%' THEN 'S8 - Wrathful'
    END AS 'Season',
    COUNT(DISTINCT nv.item) AS 'Itens em Vendors'
FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE it.name LIKE '%Gladiator%'
GROUP BY
    CASE
        WHEN it.name LIKE '%Savage%Gladiator%' THEN 'S5 - Savage (Craft)'
        WHEN it.name LIKE '%Hateful%Gladiator%' THEN 'S5 - Hateful (Honor)'
        WHEN it.name LIKE '%Deadly%Gladiator%' THEN 'S5 - Deadly (Arena)'
        WHEN it.name LIKE '%Furious%Gladiator%' THEN 'S6 - Furious'
        WHEN it.name LIKE '%Relentless%Gladiator%' THEN 'S7 - Relentless'
        WHEN it.name LIKE '%Wrathful%Gladiator%' THEN 'S8 - Wrathful'
    END
HAVING Season IS NOT NULL
ORDER BY Season;

-- ============================================================================
-- 5. QUESTS BLOQUEADAS
-- ============================================================================
SELECT '' AS '';
SELECT '--- QUESTS BLOQUEADAS (AllowableRaces = 0) ---' AS '';

SELECT
    'Argent Tournament' AS 'Categoria',
    COUNT(*) AS 'Quests Bloqueadas'
FROM quest_template
WHERE AllowableRaces = 0
AND ID BETWEEN 13633 AND 13803
UNION ALL
SELECT
    'ICC / Frozen Halls' AS 'Categoria',
    COUNT(*) AS 'Quests Bloqueadas'
FROM quest_template
WHERE AllowableRaces = 0
AND ID BETWEEN 24476 AND 24600
UNION ALL
SELECT
    'Ulduar' AS 'Categoria',
    COUNT(*) AS 'Quests Bloqueadas'
FROM quest_template
WHERE AllowableRaces = 0
AND ID BETWEEN 13380 AND 13818;

-- ============================================================================
-- 6. RESUMO FINAL
-- ============================================================================
SELECT '' AS '';
SELECT '--- RESUMO: PHASE DETECTADA ---' AS '';

SELECT
    CASE
        -- Phase 4: Sem bloqueios de ICC
        WHEN NOT EXISTS (SELECT 1 FROM disables WHERE sourceType = 2 AND entry = 631)
             AND EXISTS (SELECT 1 FROM game_event WHERE eventEntry = 60 AND NOW() BETWEEN start_time AND end_time)
        THEN '🏰 PHASE 4 - Icecrown Citadel (Conteúdo Completo)'

        -- Phase 3: ToC desbloqueado, ICC bloqueado
        WHEN NOT EXISTS (SELECT 1 FROM disables WHERE sourceType = 2 AND entry = 649)
             AND EXISTS (SELECT 1 FROM disables WHERE sourceType = 2 AND entry = 631)
        THEN '⚔️ PHASE 3 - Trial of the Crusader + Argent Tournament'

        -- Phase 2: Ulduar desbloqueado, ToC bloqueado
        WHEN NOT EXISTS (SELECT 1 FROM disables WHERE sourceType = 2 AND entry = 603)
             AND EXISTS (SELECT 1 FROM disables WHERE sourceType = 2 AND entry = 649)
        THEN '⚡ PHASE 2 - Ulduar'

        -- Phase 1: Ulduar bloqueado
        WHEN EXISTS (SELECT 1 FROM disables WHERE sourceType = 2 AND entry = 603)
        THEN '💀 PHASE 1 - Naxxramas, Eye of Eternity, Obsidian Sanctum'

        -- Sem configuração específica
        ELSE '❓ Phase não identificada ou configuração customizada'
    END AS 'Phase Atual';

SELECT '' AS '';
SELECT '========================================' AS '';
SELECT '  FIM DA VERIFICAÇÃO' AS '';
SELECT '========================================' AS '';
