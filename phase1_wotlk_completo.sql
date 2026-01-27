-- ============================================================================
-- CONFIGURAÇÃO COMPLETA PHASE 1 WOTLK - AZEROTHCORE
-- ============================================================================
-- Este script configura seu servidor para Phase 1 (Naxxramas, EoE, OS)
-- Inclui: PvP, PvE (Raids/Dungeons), Profissões, Quests
-- ============================================================================
-- IMPORTANTE: Faça backup do banco antes de executar!
-- ============================================================================

-- ============================================================================
-- PARTE 1: PVP (Arena Seasons e Vendors)
-- ============================================================================

-- 1.1 Configurar eventos de Arena Season
-- Ativar Season 5 (Phase 1)
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2030-12-31 23:59:59' WHERE eventEntry = 57;

-- Desativar Season 6, 7, 8
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2000-01-01 00:00:01' WHERE eventEntry IN (58, 59, 60);

-- 1.2 Remover vendors de Emblems de phases futuras
DELETE FROM creature WHERE id1 IN (
    33964, 33963,  -- Emblem of Conquest (Phase 2)
    35573, 35494, 35574, 35495,  -- Emblem of Triumph (Phase 3)
    37942, 38858, 37941  -- Emblem of Frost (Phase 4)
);

-- 1.3 Remover vendors de Tier Sets de phases futuras
-- T10 (ICC - Phase 4)
DELETE FROM creature WHERE id1 IN (
    37999, 37688, 37696, 37993, 38181, 35498, 37991, 38840,
    38283, 35500, 38182, 38316, 35497, 35496, 38054, 37998,
    37992, 38284, 38841, 37997
);

-- T9 (ToC - Phase 3)
DELETE FROM creature WHERE id1 IN (35579, 35580, 35576, 35575, 35578, 35577);

-- T8 (Ulduar - Phase 2)
DELETE FROM creature WHERE id1 IN (29523, 34252, 28995, 28992);

-- 1.4 Remover itens PvP de seasons 6-8 dos vendors
DELETE nv FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE it.name LIKE '%Furious%Gladiator%'
   OR it.name LIKE '%Relentless%Gladiator%'
   OR it.name LIKE '%Wrathful%Gladiator%';

-- 1.5 Remover Argent Tournament Quartermaster (Phase 3+)
DELETE FROM creature WHERE id1 = 34885;

-- ============================================================================
-- PARTE 2: PVE - DUNGEONS
-- ============================================================================

-- 2.1 Desativar Dungeons de Phases Futuras
-- Trial of the Champion (Phase 3) - Map ID 650
-- Forge of Souls (Phase 4) - Map ID 632
-- Pit of Saron (Phase 4) - Map ID 658
-- Halls of Reflection (Phase 4) - Map ID 668

-- Método 1: Bloquear acesso via disables
INSERT INTO disables (sourceType, entry, flags, params_0, params_1, comment) VALUES
(2, 650, 3, '', '', 'Trial of the Champion - Phase 3 content'),
(2, 632, 3, '', '', 'Forge of Souls - Phase 4 content'),
(2, 658, 3, '', '', 'Pit of Saron - Phase 4 content'),
(2, 668, 3, '', '', 'Halls of Reflection - Phase 4 content')
ON DUPLICATE KEY UPDATE comment = VALUES(comment);

-- 2.2 Remover NPCs de entrada das dungeons de phases futuras
-- Jaina/Sylvanas nos Frozen Halls
DELETE FROM creature WHERE id1 IN (
    36993, -- Lady Jaina Proudmoore (Frozen Halls entrance)
    37597, -- Lady Jaina Proudmoore (alternate)
    36990, -- Lady Sylvanas Windrunner (Frozen Halls entrance)
    37596  -- Lady Sylvanas Windrunner (alternate)
);

-- NPCs do Trial of the Champion entrance
DELETE FROM creature WHERE id1 IN (
    35004, -- Highlord Tirion Fordring (Trial of the Champion)
    34996, -- Arelas Brightstar (Alliance herald)
    35005, -- Jaeren Sunsworn (Horde herald)
    35008, -- Argent Herald (announces champions)
    35028, -- Argent Squire
    35029  -- Argent Gruntling
);

-- ============================================================================
-- PARTE 3: PVE - RAIDS
-- ============================================================================

-- 3.1 Desativar Raids de Phases Futuras
-- Ulduar (Phase 2) - Map ID 603
-- Trial of the Crusader (Phase 3) - Map ID 649
-- Icecrown Citadel (Phase 4) - Map ID 631
-- Ruby Sanctum (Phase 4) - Map ID 724

INSERT INTO disables (sourceType, entry, flags, params_0, params_1, comment) VALUES
(2, 603, 3, '', '', 'Ulduar - Phase 2 content'),
(2, 649, 3, '', '', 'Trial of the Crusader - Phase 3 content'),
(2, 631, 3, '', '', 'Icecrown Citadel - Phase 4 content'),
(2, 724, 3, '', '', 'Ruby Sanctum - Phase 4 content')
ON DUPLICATE KEY UPDATE comment = VALUES(comment);

-- 3.2 Remover teleports para raids futuras
-- Ulduar teleport NPCs
DELETE FROM creature WHERE id1 IN (
    33957, -- Lore Keeper of Norgannon (Ulduar teleport)
    34122, -- Expedition Engineer (Ulduar)
    33956  -- Archemedus (Ulduar)
);

-- Trial of the Crusader entrance NPCs
DELETE FROM creature WHERE id1 IN (
    34816, -- Highlord Tirion Fordring (ToC entrance)
    35766, -- Barrett Ramsey (Darkmoon Faire)
    35153, -- Fizzlebang (summons Jaraxxus)
    34564  -- Argent Coliseum Announcer
);

-- ICC entrance/teleport NPCs
DELETE FROM creature WHERE id1 IN (
    37597, -- Lady Jaina Proudmoore (ICC entrance)
    37596, -- Lady Sylvanas Windrunner (ICC entrance)
    37592, -- Lady Jaina Proudmoore (ICC Light's Hammer)
    37593, -- Muradin Bronzebeard (ICC Light's Hammer)
    37591, -- Lady Sylvanas Windrunner (ICC Light's Hammer)
    37580, -- Highlord Tirion Fordring (ICC)
    37120, -- Highlord Tirion Fordring (ICC Frozen Throne)
    38995, -- Highlord Tirion Fordring (ICC final)
    36856, -- Crok Scourgebane (ICC)
    36649, -- Captain Arnath (ICC)
    36650, -- Captain Brandon (ICC)
    36651, -- Captain Grondel (ICC)
    36652, -- Captain Rupert (ICC)
    37904, -- Teleport to Light's Hammer
    37955, -- Teleport to Oratory
    37156, -- Teleport to various ICC
    38311  -- ICC Spire Frostwyrm
);

-- Ruby Sanctum entrance
DELETE FROM creature WHERE id1 IN (
    39746, -- Sanctum Guardian Xerestrasza
    39747, -- Baltharus the Warborn (trash)
    39751, -- General Zarithrian
    39863, -- Halion (boss)
    40142  -- Halion (twilight form)
);

-- 3.3 Remover portais de raid de phases futuras (gameobjects)
DELETE FROM gameobject WHERE id IN (
    194569, -- Portal to Ulduar (Dalaran)
    195701, -- Trial of the Crusader Portal
    201584, -- Icecrown Citadel Portal
    202741  -- Ruby Sanctum Portal
);

-- ============================================================================
-- PARTE 4: PROFISSÕES
-- ============================================================================

-- 4.1 Desativar receitas de profissões de phases futuras
-- Estas receitas dropam em raids/dungeons de phases posteriores

-- Receitas que dropam em Ulduar (Phase 2)
DELETE FROM creature_loot_template WHERE Item IN (
    -- Blacksmithing - Ulduar patterns
    45088, 45089, 45090, 45091, 45092, 45093,
    -- Leatherworking - Ulduar patterns
    45094, 45095, 45096, 45097, 45098, 45099, 45100,
    -- Tailoring - Ulduar patterns
    45101, 45102, 45103, 45104
);

-- Receitas que dropam em ToC/ICC (Phase 3-4)
-- Pattern: Legguards of Woven Death, etc.
DELETE FROM creature_loot_template WHERE Item IN (
    -- ICC Patterns
    49969, 49970, 49971, 49972, 49973, 49974, -- Leather patterns
    50447, 50449, 50451, 50454, 50456, 50457, -- Cloth patterns
    50442, 50443, 50444, 50445, 50446, 50450, 50452, 50453, 50455 -- Mail/Plate patterns
);

-- 4.2 Remover receitas de factions de phases futuras dos vendors
-- Ashen Verdict recipes (ICC - Phase 4)
DELETE FROM npc_vendor WHERE item IN (
    -- Plans: Boots of Kingly Upheaval, etc.
    49957, 49958, 49959, 49960, 49961, 49962, 49963, 49964,
    -- Pattern: Sandals of Consecration, etc.
    49965, 49966, 49967, 49968
);

-- 4.3 Desativar trainer recipes de phases futuras
-- Estas receitas requerem mats que só dropam em raids futuras
-- Comentado para não quebrar progressão de profissão
-- Descomente se quiser remover completamente

/*
-- Tailoring - Moonshroud/Ebonweave/Spellweave cooldowns ainda disponíveis em Phase 1
-- Mas itens que usam Crusader Orbs ou Primordial Saronite devem ser bloqueados

-- Alchemy transmutes de mats ICC
DELETE FROM npc_trainer WHERE SpellID IN (
    -- Transmute: Cardinal Ruby (Alchemy) - Requer mats ICC
    66658, 66659, 66660, 66662, 66663, 66664
);
*/

-- 4.4 Remover itens craftados de phases futuras dos vendors (se houver)
-- Estes não devem estar em vendors, mas por segurança
DELETE nv FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE it.ItemLevel >= 245  -- Itens ilvl 245+ são de Phase 3+
  AND it.Quality >= 4      -- Epic ou superior
  AND it.RequiredLevel >= 80;

-- ============================================================================
-- PARTE 5: QUESTS
-- ============================================================================

-- 5.1 Desativar Quests do Argent Tournament (Phase 3+)
-- Quest chain principal do torneio
UPDATE quest_template SET AllowableRaces = 0 WHERE ID IN (
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

-- 5.2 Desativar Quests de ICC (Phase 4)
UPDATE quest_template SET AllowableRaces = 0 WHERE ID IN (
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

-- 5.3 Desativar Quests de Ulduar (Phase 2) - Opcionais
UPDATE quest_template SET AllowableRaces = 0 WHERE ID IN (
    -- Algalon/Celestial Planetarium
    13604, 13605, 13606, 13607, 13608, 13609, 13610,
    -- Herald of the Titans related
    13816, 13817, 13818,
    -- Ulduar attunement/story
    13380, 13381, 13382, 13383, 13384, 13385
);

-- 5.4 Desativar Quests do Trial of the Crusader (Phase 3)
UPDATE quest_template SET AllowableRaces = 0 WHERE ID IN (
    -- ToC intro/attunement
    14178, 14179, 14180, 14181, 14182,
    -- Call of the Crusade story
    14145, 14146, 14147, 14148, 14149, 14150
);

-- 5.5 Desativar NPCs de Quest de phases futuras
-- Argent Tournament NPCs principais
DELETE FROM creature WHERE id1 IN (
    33817, -- Justicar Mariel Trueheart
    33759, -- Argent Confessor Paletress
    33379, -- Argent Tournament Herald
    33738, -- Arcanist Taelis (Portal to Dalaran)
    33225, -- Argent Pavilion Worker
    33849, -- Argent Tournament Quest Giver
    33592, -- Squire David
    33593, -- Squire Danny
    33448, -- Argent Quartermaster (general)
    33657, -- Eadric the Pure (Champion)
    33690  -- Argent Valiant
);

-- NPCs de Quest ICC (Dalaran/Storm Peaks relacionados)
DELETE FROM creature WHERE id1 IN (
    36597, -- The Lich King (Vision in Storm Peaks after ICC opens)
    37948, -- Crok Scourgebane (quest giver)
    37949, -- Captain Arnath (quest related)
    38738, -- Highlord Bolvar Fordragon (after ICC)
    38225  -- Highlord Tirion Fordring (ICC quest chain)
);

-- ============================================================================
-- PARTE 6: ACHIEVEMENTS (Opcional)
-- ============================================================================

-- 6.1 Desativar Achievements de raids futuras
-- Isto é opcional pois os achievements não podem ser obtidos sem acesso às raids
-- Descomente se quiser esconder completamente

/*
INSERT INTO disables (sourceType, entry, flags, params_0, params_1, comment) VALUES
-- Ulduar Achievements (Phase 2)
(4, 2894, 0, '', '', 'Ulduar: Glory of the Ulduar Raider (10)'),
(4, 2895, 0, '', '', 'Ulduar: Glory of the Ulduar Raider (25)'),
(4, 3036, 0, '', '', 'Ulduar: Observed (10)'),
(4, 3037, 0, '', '', 'Ulduar: Observed (25)'),
-- ToC Achievements (Phase 3)
(4, 3917, 0, '', '', 'ToC: Call of the Grand Crusade (10)'),
(4, 3918, 0, '', '', 'ToC: Call of the Grand Crusade (25)'),
-- ICC Achievements (Phase 4)
(4, 4602, 0, '', '', 'ICC: Glory of the Icecrown Raider (10)'),
(4, 4603, 0, '', '', 'ICC: Glory of the Icecrown Raider (25)')
ON DUPLICATE KEY UPDATE comment = VALUES(comment);
*/

-- ============================================================================
-- PARTE 7: ITEMS ESPECIAIS
-- ============================================================================

-- 7.1 Remover items legendários de phases futuras dos loot tables
-- Val'anyr, Hammer of Ancient Kings (Ulduar - Phase 2)
DELETE FROM creature_loot_template WHERE Item = 45038; -- Fragment of Val'anyr
DELETE FROM gameobject_loot_template WHERE Item = 45038;

-- Shadowmourne (ICC - Phase 4)
DELETE FROM creature_loot_template WHERE Item IN (
    49623, -- Shadow's Edge (precursor)
    49888, -- Shadow's Edge (upgraded)
    50274  -- Shadowmourne
);

-- 7.2 Remover mounts de phases futuras
-- Invincible (ICC - Phase 4)
DELETE FROM creature_loot_template WHERE Item = 50818;
-- Mimiron's Head (Ulduar - Phase 2)
DELETE FROM creature_loot_template WHERE Item = 45693;
-- Argent Hippogryph (Argent Tournament - Phase 3)
DELETE FROM npc_vendor WHERE item = 45725;
-- Crusader mounts
DELETE FROM npc_vendor WHERE item IN (
    46745, 46746, 46747, 46748, 46749, 46750, 46751, 46752
);

-- 7.3 Remover heirlooms de Argent Tournament (Phase 3)
DELETE FROM npc_vendor WHERE item IN (
    42943, 42944, 42945, 42946, 42947, 42948, 42949, 42950,
    42951, 42952, 44091, 44092, 44093, 44094, 44095, 44096,
    44097, 44098, 44099, 44100, 44101, 44102, 44103, 44104,
    44105, 44107, 48677, 48683, 48685, 48687, 48689, 48691
) AND entry = 34885; -- Dame Evniki Kapsalis only

-- ============================================================================
-- PARTE 8: WORLD BOSSES (Se aplicável)
-- ============================================================================

-- 8.1 Em WotLK Phase 1, todos os world bosses originais estão disponíveis
-- Não há world bosses exclusivos de phases posteriores no WotLK

-- ============================================================================
-- PARTE 9: CORREÇÕES DE LOOT TABLES (Emblems)
-- ============================================================================

-- 9.1 Garantir que dungeons heroicas dropam apenas Emblem of Heroism
-- (Comportamento original da Phase 1)
-- Em phases posteriores, os emblems foram alterados

-- Naxxramas 10-man - Emblem of Heroism (40752)
-- Naxxramas 25-man - Emblem of Valor (40753)
-- Isso é o comportamento padrão, mas garantimos:

-- Remover Emblem of Conquest (Phase 2) dos loot tables de Phase 1
DELETE FROM creature_loot_template WHERE Item = 45624 AND Entry IN (
    SELECT entry FROM creature_template WHERE rank = 3 -- World bosses
);

-- Remover Emblem of Triumph (Phase 3)
DELETE FROM creature_loot_template WHERE Item = 47241;
DELETE FROM reference_loot_template WHERE Item = 47241;

-- Remover Emblem of Frost (Phase 4)
DELETE FROM creature_loot_template WHERE Item = 49426;
DELETE FROM reference_loot_template WHERE Item = 49426;

-- ============================================================================
-- FINALIZAÇÃO
-- ============================================================================

-- Limpar cache de quests (requer restart do server)
-- O servidor precisa ser reiniciado para aplicar todas as mudanças

SELECT 'Configuração Phase 1 aplicada com sucesso!' AS Status;
SELECT 'Reinicie o worldserver para aplicar todas as mudanças.' AS Aviso;
