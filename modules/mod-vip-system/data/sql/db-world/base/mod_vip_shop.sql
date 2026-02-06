-- ============================================================
-- VIP Shop System - Tables, NPCs and Items
-- ============================================================

-- ============================================================
-- Tables
-- ============================================================

CREATE TABLE IF NOT EXISTS `mod_vip_shop` (
  `vendor_type` TINYINT UNSIGNED NOT NULL,
  `item_entry`  INT UNSIGNED NOT NULL,
  `price`       INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`vendor_type`, `item_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mod_vip_shop_npc` (
  `creature_entry` INT UNSIGNED NOT NULL,
  `vendor_type`    TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`creature_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- NPC Text
-- ============================================================

DELETE FROM `npc_text` WHERE `ID` = 200001;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES
(200001, 'Bem-vindo a Loja VIP! Selecione um item para visualizar detalhes e comprar com seus dias VIP.', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ============================================================
-- Creature Templates (NPCs)
-- npcflag=1 (GOSSIP), ScriptName='npc_vip_shop'
-- type=7 (Humanoid), rank=0 (Normal), flags_extra=16777216 (CREATURE_FLAG_EXTRA_NO_XP)
-- ============================================================

DELETE FROM `creature_template` WHERE `entry` BETWEEN 200001 AND 200013;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(200001, 0, 0, 0, 0, 0, 'Loja VIP', 'Armas',                '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200002, 0, 0, 0, 0, 0, 'Loja VIP', 'Elmos',                '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200003, 0, 0, 0, 0, 0, 'Loja VIP', 'Ombros',               '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200004, 0, 0, 0, 0, 0, 'Loja VIP', 'Peitorais',            '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200005, 0, 0, 0, 0, 0, 'Loja VIP', 'Pernas',               '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200006, 0, 0, 0, 0, 0, 'Loja VIP', 'Pes',                  '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200007, 0, 0, 0, 0, 0, 'Loja VIP', 'Maos',                 '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200008, 0, 0, 0, 0, 0, 'Loja VIP', 'Pulsos',               '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200009, 0, 0, 0, 0, 0, 'Loja VIP', 'Cintura',              '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200010, 0, 0, 0, 0, 0, 'Loja VIP', 'Capas',                '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200011, 0, 0, 0, 0, 0, 'Loja VIP', 'Aneis/Amuletos/Trinkets', '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200012, 0, 0, 0, 0, 0, 'Loja VIP', 'Consumiveis',          '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0),
(200013, 0, 0, 0, 0, 0, 'Loja VIP', 'Escudos/Off-hands',    '', 0, 80, 80, 0, 35, 1, 1, 1.14286, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 16777216, 'npc_vip_shop', 0);

-- ============================================================
-- Creature Template Models (DisplayID)
-- Todos usam model 18786 (Human Female Vendor look)
-- ============================================================

DELETE FROM `creature_template_model` WHERE `CreatureID` BETWEEN 200001 AND 200013;
INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES
(200001, 0, 18786, 1, 1, 12340),
(200002, 0, 18786, 1, 1, 12340),
(200003, 0, 18786, 1, 1, 12340),
(200004, 0, 18786, 1, 1, 12340),
(200005, 0, 18786, 1, 1, 12340),
(200006, 0, 18786, 1, 1, 12340),
(200007, 0, 18786, 1, 1, 12340),
(200008, 0, 18786, 1, 1, 12340),
(200009, 0, 18786, 1, 1, 12340),
(200010, 0, 18786, 1, 1, 12340),
(200011, 0, 18786, 1, 1, 12340),
(200012, 0, 18786, 1, 1, 12340),
(200013, 0, 18786, 1, 1, 12340);

-- ============================================================
-- NPC -> Vendor Type Mapping
-- ============================================================

DELETE FROM `mod_vip_shop_npc` WHERE `creature_entry` BETWEEN 200001 AND 200013;
INSERT INTO `mod_vip_shop_npc` (`creature_entry`, `vendor_type`) VALUES
(200001, 1),  -- Armas
(200002, 2),  -- Elmos
(200003, 3),  -- Ombros
(200004, 4),  -- Peitorais
(200005, 5),  -- Pernas
(200006, 6),  -- Pes
(200007, 7),  -- Maos
(200008, 8),  -- Pulsos
(200009, 9),  -- Cintura
(200010, 10), -- Capas
(200011, 11), -- Aneis/Amuletos/Trinkets
(200012, 12), -- Consumiveis
(200013, 13); -- Escudos/Off-hands

-- ============================================================
-- Shop Items
-- Prices: ilvl 277-284 = 5-7 dias, ilvl 264 = 3-4 dias,
--         ilvl 245-271 = 2-3 dias, Consumiveis = 1 dia
-- ============================================================

DELETE FROM `mod_vip_shop` WHERE `vendor_type` BETWEEN 1 AND 13;

-- ============================================================
-- Type 1: Armas (Weapons)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 284) - 7 dias
(1, 50738, 7),  -- Mithrios, Bronzebeard's Legacy (1H Sword)
(1, 50736, 7),  -- Heaven's Fall, Kryss of a Thousand Lies (1H Dagger)
(1, 50737, 7),  -- Havoc's Call, Blade of Lordaeron Kings (1H Sword)
(1, 50731, 7),  -- Archus, Greatstaff of Antonidas (Staff)
(1, 50735, 7),  -- Oathbinder, Charge of the Ranger-General (Polearm)
(1, 50730, 7),  -- Glorenzelg, High-Blade of the Silver Hand (2H Sword)
(1, 50734, 7),  -- Royal Scepter of Terenas II (Wand)
(1, 50732, 7),  -- Bloodsurge, Kel'Thuzad's Blade of Agony (Wand)
(1, 50733, 7),  -- Fal'inrush, Defender of Quel'thalas (Crossbow)
-- ICC 25H (ilvl 277) - 5 dias
(1, 50708, 5),  -- Last Word (1H Sword)
(1, 50641, 5),  -- Heartpierce (1H Dagger)
(1, 50621, 5),  -- Lungbreaker (1H Mace)
(1, 50672, 5),  -- Bloodvenom Blade (1H Dagger)
(1, 50676, 5),  -- Rib Spreader (1H Axe)
(1, 50654, 5),  -- Scourgeborne Waraxe (1H Axe)
(1, 50603, 5),  -- Cryptmaker (2H Mace)
(1, 50709, 5),  -- Bryntroll, the Bone Arbiter (2H Axe)
(1, 50725, 5),  -- Dying Light (Staff)
(1, 50648, 5),  -- Nibelung (Staff)
(1, 50727, 5),  -- Bloodfall (Polearm)
(1, 50695, 5),  -- Distant Land (Staff)
(1, 50685, 5),  -- Trauma (Wand)
(1, 50638, 5);  -- Zod's Repeating Longbow (Bow)

-- ============================================================
-- Type 2: Elmos (Head)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 277) - 5 dias
(2, 50713, 5),  -- Geistlord's Punishment Sack
(2, 51221, 5),  -- Sanctified Ymirjar Lord's Greathelm (Warrior)
(2, 51281, 5),  -- Sanctified Bloodmage Hood (Mage)
(2, 51312, 5),  -- Sanctified Scourgelord Helmet (DK DPS)
(2, 51286, 5),  -- Sanctified Ahn'Kahar Blood Hunter's Headpiece (Hunter)
(2, 51302, 5),  -- Sanctified Lasherweave Helmet (Druid Balance)
(2, 51306, 5),  -- Sanctified Scourgelord Faceguard (DK Tank)
(2, 51227, 5),  -- Sanctified Ymirjar Lord's Helmet (Warrior)
(2, 51255, 5),  -- Sanctified Crimson Acolyte Cowl (Priest Shadow)
(2, 51272, 5),  -- Sanctified Lightsworn Headpiece (Paladin Holy)
(2, 51277, 5),  -- Sanctified Lightsworn Helmet (Paladin Ret)
(2, 51261, 5),  -- Sanctified Crimson Acolyte Hood (Priest Heal)
(2, 51231, 5),  -- Sanctified Dark Coven Hood (Warlock)
(2, 51242, 5),  -- Sanctified Frost Witch's Faceguard (Shaman Resto)
(2, 51252, 5),  -- Sanctified Shadowblade Helmet (Rogue)
(2, 51296, 5),  -- Sanctified Lasherweave Headguard (Druid Feral)
(2, 51266, 5),  -- Sanctified Lightsworn Faceguard (Paladin Tank)
(2, 51237, 5),  -- Sanctified Frost Witch's Helm (Shaman Ele)
(2, 51290, 5),  -- Sanctified Lasherweave Cover (Druid Resto)
(2, 51247, 5),  -- Sanctified Frost Witch's Headpiece (Shaman Enh)
(2, 50712, 5),  -- Landsoul's Horned Greathelm
(2, 50605, 5),  -- Snowserpent Mail Helm
(2, 50626, 5),  -- Snowstorm Helm
(2, 50640, 5),  -- Broken Ram Skull Helm
(2, 50679, 5),  -- Helm of the Elder Moon
(2, 50701, 5);  -- Faceplate of the Forgotten

-- ============================================================
-- Type 3: Ombros (Shoulders)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 277) - 5 dias
(3, 50698, 5),  -- Horrific Flesh Epaulets
(3, 51224, 5),  -- Sanctified Ymirjar Lord's Pauldrons (Warrior)
(3, 51284, 5),  -- Sanctified Bloodmage Shoulderpads (Mage)
(3, 51314, 5),  -- Sanctified Scourgelord Shoulderplates (DK DPS)
(3, 51288, 5),  -- Sanctified Ahn'Kahar Blood Hunter's Spaulders (Hunter)
(3, 51304, 5),  -- Sanctified Lasherweave Pauldrons (Druid Balance)
(3, 51309, 5),  -- Sanctified Scourgelord Pauldrons (DK Tank)
(3, 51229, 5),  -- Sanctified Ymirjar Lord's Shoulderplates (Warrior)
(3, 51257, 5),  -- Sanctified Crimson Acolyte Mantle (Priest Shadow)
(3, 51273, 5),  -- Sanctified Lightsworn Spaulders (Paladin Holy)
(3, 51279, 5),  -- Sanctified Lightsworn Shoulderplates (Paladin Ret)
(3, 51264, 5),  -- Sanctified Crimson Acolyte Shoulderpads (Priest Heal)
(3, 51235, 5),  -- Sanctified Frost Witch's Shoulderpads (Shaman Ele)
(3, 51254, 5),  -- Sanctified Shadowblade Pauldrons (Rogue)
(3, 51299, 5),  -- Sanctified Lasherweave Shoulderpads (Druid Feral)
(3, 51269, 5),  -- Sanctified Lightsworn Shoulderguards (Paladin Tank)
(3, 51245, 5),  -- Sanctified Frost Witch's Spaulders (Shaman Enh)
(3, 51292, 5),  -- Sanctified Lasherweave Mantle (Druid Resto)
(3, 51240, 5),  -- Sanctified Frost Witch's Shoulderguards (Shaman Resto)
(3, 51234, 5),  -- Sanctified Dark Coven Shoulderpads (Warlock)
(3, 50715, 5),  -- Shoulders of Frost-Tipped Thorns
(3, 50674, 5),  -- Raging Behemoth's Shoulderplates
(3, 50617, 5),  -- Rusted Bonespike Pauldrons
(3, 50643, 5),  -- Shoulders of Mercy Killing
(3, 50673, 5);  -- Dual-Bladed Pauldrons

-- ============================================================
-- Type 4: Peitorais (Chest)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 277) - 5 dias
(4, 50689, 5),  -- Carapace of Forgotten Kings
(4, 51220, 5),  -- Sanctified Ymirjar Lord's Breastplate (Warrior Prot)
(4, 51275, 5),  -- Sanctified Lightsworn Battleplate (Paladin Ret)
(4, 51305, 5),  -- Sanctified Scourgelord Chestguard (DK Tank)
(4, 51310, 5),  -- Sanctified Scourgelord Battleplate (DK DPS)
(4, 51283, 5),  -- Sanctified Bloodmage Robe (Mage)
(4, 51298, 5),  -- Sanctified Lasherweave Raiment (Druid Resto)
(4, 51300, 5),  -- Sanctified Lasherweave Robes (Druid Balance)
(4, 51225, 5),  -- Sanctified Ymirjar Lord's Battleplate (Warrior DPS)
(4, 51250, 5),  -- Sanctified Shadowblade Breastplate (Rogue)
(4, 51265, 5),  -- Sanctified Lightsworn Chestguard (Paladin Tank)
(4, 51274, 5),  -- Sanctified Lightsworn Tunic (Paladin Holy)
(4, 51239, 5),  -- Sanctified Frost Witch's Hauberk (Shaman Enh)
(4, 51259, 5),  -- Sanctified Crimson Acolyte Raiments (Priest Shadow)
(4, 51233, 5),  -- Sanctified Dark Coven Robe (Warlock)
(4, 51244, 5),  -- Sanctified Frost Witch's Chestguard (Shaman Resto)
(4, 51289, 5),  -- Sanctified Ahn'Kahar Blood Hunter's Tunic (Hunter)
(4, 51249, 5),  -- Sanctified Frost Witch's Tunic (Shaman Ele)
(4, 51263, 5),  -- Sanctified Crimson Acolyte Robe (Priest Heal)
(4, 51294, 5),  -- Sanctified Lasherweave Vestment (Druid Feral)
(4, 50723, 5),  -- Mail of Crimson Coins
(4, 50717, 5),  -- Sanguine Silk Robes
(4, 50681, 5),  -- Blightborne Warplate
(4, 50680, 5),  -- Rot-Resistant Breastplate
(4, 50656, 5);  -- Ikfirus's Sack of Wonder

-- ============================================================
-- Type 5: Pernas (Legs)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 277) - 5 dias
(5, 50697, 5),  -- Gangrenous Leggings
(5, 50696, 5),  -- Leather of Stitched Scourge Parts
(5, 51228, 5),  -- Sanctified Ymirjar Lord's Legplates (Warrior DPS)
(5, 51223, 5),  -- Sanctified Ymirjar Lord's Legguards (Warrior Prot)
(5, 51271, 5),  -- Sanctified Lightsworn Greaves (Paladin Holy)
(5, 51308, 5),  -- Sanctified Scourgelord Legguards (DK Tank)
(5, 51313, 5),  -- Sanctified Scourgelord Legplates (DK DPS)
(5, 51278, 5),  -- Sanctified Lightsworn Legplates (Paladin Ret)
(5, 51293, 5),  -- Sanctified Lasherweave Trousers (Druid Resto)
(5, 51241, 5),  -- Sanctified Frost Witch's War-Kilt (Shaman Resto)
(5, 51232, 5),  -- Sanctified Dark Coven Leggings (Warlock)
(5, 51303, 5),  -- Sanctified Lasherweave Legplates (Druid Balance)
(5, 51282, 5),  -- Sanctified Bloodmage Leggings (Mage)
(5, 51236, 5),  -- Sanctified Frost Witch's Kilt (Shaman Ele)
(5, 51258, 5),  -- Sanctified Crimson Acolyte Pants (Priest Shadow)
(5, 51268, 5),  -- Sanctified Lightsworn Legguards (Paladin Tank)
(5, 51246, 5),  -- Sanctified Frost Witch's Legguards (Shaman Enh)
(5, 51297, 5),  -- Sanctified Lasherweave Legguards (Druid Feral)
(5, 51253, 5),  -- Sanctified Shadowblade Legplates (Rogue)
(5, 51262, 5),  -- Sanctified Crimson Acolyte Leggings (Priest Heal)
(5, 51287, 5),  -- Sanctified Ahn'Kahar Blood Hunter's Legguards (Hunter)
(5, 50694, 5),  -- Plaguebringer's Stained Pants
(5, 50645, 5),  -- Leggings of Northern Lights
(5, 50624, 5),  -- Scourge Reaver's Legplates
(5, 50612, 5);  -- Legguards of Lost Hope

-- ============================================================
-- Type 6: Pes (Feet)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- Crafted ICC (ilvl 284) - 7 dias
(6, 54579, 7),  -- Treads of Impending Resurrection
(6, 54577, 7),  -- Returning Footfalls
(6, 54586, 7),  -- Foreshadow Steps
(6, 54578, 7),  -- Apocalypse's Advance
-- ICC 25H (ilvl 277) - 5 dias
(6, 50711, 5),  -- Treads of the Wasteland
(6, 50699, 5),  -- Plague Scientist's Boots
(6, 50665, 5),  -- Boots of Unnatural Growth
(6, 50652, 5),  -- Necrophotic Greaves
(6, 50639, 5),  -- Blood-Soaked Saronite Stompers
(6, 50632, 5),  -- Boots of the Funeral March
(6, 50625, 5),  -- Grinning Skull Greatboots
(6, 50607, 5),  -- Frostbitten Fur Boots
-- ICC crafted (ilvl 271) - 3 dias
(6, 53127, 3),  -- Returning Footfalls
(6, 53125, 3),  -- Apocalypse's Advance
(6, 54558, 3),  -- Boots of Divided Being
(6, 53129, 3),  -- Treads of Impending Resurrection
(6, 53487, 3),  -- Foreshadow Steps
(6, 54564, 3);  -- Scion's Treads

-- ============================================================
-- Type 7: Maos (Hands)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 277) - 5 dias
(7, 50703, 5),  -- Unclean Surgical Gloves
(7, 51222, 5),  -- Sanctified Ymirjar Lord's Handguards (Warrior Prot)
(7, 51276, 5),  -- Sanctified Lightsworn Gauntlets (Paladin Ret)
(7, 51307, 5),  -- Sanctified Scourgelord Handguards (DK Tank)
(7, 51311, 5),  -- Sanctified Scourgelord Gauntlets (DK DPS)
(7, 51280, 5),  -- Sanctified Bloodmage Gloves (Mage)
(7, 51295, 5),  -- Sanctified Lasherweave Handgrips (Druid Feral)
(7, 51301, 5),  -- Sanctified Lasherweave Gauntlets (Druid Balance)
(7, 51226, 5),  -- Sanctified Ymirjar Lord's Gauntlets (Warrior DPS)
(7, 51251, 5),  -- Sanctified Shadowblade Gauntlets (Rogue)
(7, 51267, 5),  -- Sanctified Lightsworn Handguards (Paladin Tank)
(7, 51270, 5),  -- Sanctified Lightsworn Gloves (Paladin Holy)
(7, 51238, 5),  -- Sanctified Frost Witch's Gloves (Shaman Ele)
(7, 51256, 5),  -- Sanctified Crimson Acolyte Handwraps (Priest Shadow)
(7, 51230, 5),  -- Sanctified Dark Coven Gloves (Warlock)
(7, 51243, 5),  -- Sanctified Frost Witch's Grips (Shaman Resto)
(7, 51285, 5),  -- Sanctified Ahn'Kahar Blood Hunter's Handguards (Hunter)
(7, 51248, 5),  -- Sanctified Frost Witch's Handguards (Shaman Enh)
(7, 51260, 5),  -- Sanctified Crimson Acolyte Gloves (Priest Heal)
(7, 51291, 5),  -- Sanctified Lasherweave Gloves (Druid Resto)
(7, 50722, 5),  -- San'layn Ritualist Gloves
(7, 50716, 5),  -- Taldaram's Plated Fists
(7, 50690, 5),  -- Fleshrending Gauntlets
(7, 50675, 5),  -- Aldriana's Gloves of Secrecy
(7, 50615, 5);  -- Handguards of Winter's Respite

-- ============================================================
-- Type 8: Pulsos (Wrist)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- Crafted ICC (ilvl 284) - 7 dias
(8, 54582, 7),  -- Bracers of Fiery Night
(8, 54584, 7),  -- Phaseshifter's Bracers
(8, 54580, 7),  -- Umbrage Armbands
-- ICC 25H (ilvl 277) - 5 dias
(8, 50721, 5),  -- Crypt Keeper's Bracers
(8, 50687, 5),  -- Bloodsunder's Bracers
(8, 50686, 5),  -- Death Surgeon's Sleeves
(8, 50611, 5),  -- Bracers of Dark Reckoning
(8, 50630, 5),  -- Bracers of Eternal Dreaming
(8, 50651, 5),  -- The Lady's Brittle Bracers
(8, 50655, 5),  -- Scourge Hunter's Vambraces
(8, 50659, 5),  -- Polar Bear Claw Bracers
(8, 50670, 5),  -- Toskk's Maximized Wristguards
-- ICC crafted (ilvl 271) - 3 dias
(8, 53126, 3),  -- Umbrage Armbands
(8, 54559, 3),  -- Bracers of the Heir
(8, 53134, 3),  -- Phaseshifter's Bracers
(8, 53486, 3);  -- Bracers of Fiery Night

-- ============================================================
-- Type 9: Cintura (Waist)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- Crafted ICC (ilvl 284) - 7 dias
(9, 54587, 7),  -- Split Shape Belt
-- ICC 25H (ilvl 277) - 5 dias
(9, 50707, 5),  -- Astrylian's Sutured Cinch
(9, 50705, 5),  -- Professor's Bloodied Smock
(9, 50702, 5),  -- Lingering Illness
(9, 50691, 5),  -- Belt of Broken Bones
(9, 50688, 5),  -- Nerub'ar Stalker's Cord
(9, 50671, 5),  -- Belt of the Blood Nova
(9, 50667, 5),  -- Waistband of Righteous Fury
(9, 50613, 5),  -- Crushing Coldwraith Belt
(9, 50620, 5),  -- Coldwraith Links
-- ICC crafted (ilvl 271) - 3 dias
(9, 53488, 3),  -- Split Shape Belt
(9, 54562, 3),  -- Misbegotten Belt
(9, 54565, 3),  -- Surrogate Belt
-- ICC 25N (ilvl 264) - 3 dias
(9, 50997, 3),  -- Circle of Ossus
(9, 50996, 3),  -- Belt of Omission
(9, 50995, 3),  -- Vengeful Noose
(9, 50994, 3),  -- Belt of Petrified Ivy
(9, 50993, 3),  -- Band of the Night Raven
(9, 50992, 3),  -- Waistband of Despair
(9, 50989, 3),  -- Lich Killer's Lanyard
(9, 50987, 3);  -- Malevolent Girdle

-- ============================================================
-- Type 10: Capas (Cloaks)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- Crafted ICC (ilvl 284) - 7 dias
(10, 54583, 7),  -- Cloak of Burning Dusk
-- ICC 25H (ilvl 277) - 5 dias
(10, 50628, 5),  -- Frostbinder's Shredded Cape
(10, 50653, 5),  -- Shadowvault Slayer's Cloak
(10, 50668, 5),  -- Greatcloak of the Turned Champion
(10, 50677, 5),  -- Winding Sheet
(10, 50718, 5),  -- Royal Crimson Cloak
-- ToC 25H (ilvl 272) - 3 dias
(10, 47546, 3),  -- Sylvanas' Cunning
(10, 47545, 3),  -- Vereesa's Dexterity
(10, 47554, 3),  -- Lady Liadrin's Conviction
(10, 47553, 3),  -- Bolvar's Devotion
(10, 47552, 3),  -- Jaina's Radiance
(10, 47551, 3),  -- Aethas' Intensity
(10, 47550, 3),  -- Cairne's Endurance
(10, 47549, 3),  -- Magni's Resolution
(10, 47548, 3),  -- Garrosh's Rage
(10, 47547, 3),  -- Varian's Furor
-- ICC crafted (ilvl 271) - 3 dias
(10, 53489, 3),  -- Cloak of Burning Dusk
(10, 54556, 3);  -- Abduction's Cover

-- ============================================================
-- Type 11: Aneis/Amuletos/Trinkets
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- Ruby Sanctum (ilvl 284) - 7 dias
(11, 54581, 7),  -- Penumbra Pendant (Neck)
(11, 54591, 7),  -- Petrified Twilight Scale (Trinket)
(11, 54590, 7),  -- Sharpened Twilight Scale (Trinket)
(11, 54585, 7),  -- Ring of Phased Regeneration (Ring)
(11, 54589, 7),  -- Glowing Twilight Scale (Trinket)
(11, 54588, 7),  -- Charred Twilight Scale (Trinket)
(11, 54576, 7),  -- Signet of Twilight (Ring)
-- ICC 25H (ilvl 277) - 5 dias
(11, 50398, 5),  -- Ashen Band of Endless Destruction (Ring)
(11, 52572, 5),  -- Ashen Band of Endless Might (Ring)
(11, 50404, 5),  -- Ashen Band of Endless Courage (Ring)
(11, 50402, 5),  -- Ashen Band of Endless Vengeance (Ring)
(11, 50400, 5),  -- Ashen Band of Endless Wisdom (Ring)
(11, 50348, 5),  -- Dislodged Foreign Object (Trinket)
(11, 50349, 5),  -- Corpse Tongue Coin (Trinket)
(11, 50726, 5),  -- Bauble of True Blood (Trinket)
(11, 50706, 5),  -- Tiny Abomination in a Jar (Trinket)
(11, 50365, 5),  -- Phylactery of the Nameless Lich (Trinket)
(11, 50363, 5),  -- Deathbringer's Will (Trinket)
(11, 50364, 5),  -- Sindragosa's Flawless Fang (Trinket)
(11, 50658, 5),  -- Amulet of the Silent Eulogy (Neck)
(11, 50627, 5),  -- Noose of Malachite (Neck)
(11, 50714, 5),  -- Valanar's Other Signet Ring (Ring)
(11, 50604, 5),  -- Band of the Bone Colossus (Ring)
(11, 50622, 5),  -- Devium's Eternally Cold Ring (Ring)
(11, 50614, 5),  -- Loop of the Endless Labyrinth (Ring)
(11, 50682, 5),  -- Bile-Encrusted Medallion (Neck)
(11, 50700, 5),  -- Holiday's Grace (Neck)
(11, 50728, 5),  -- Lana'thel's Chain of Flagellation (Neck)
(11, 50724, 5),  -- Blood Queen's Crimson Choker (Neck)
(11, 50633, 5);  -- Sindragosa's Cruel Claw (Neck)

-- ============================================================
-- Type 12: Consumiveis (Consumables/Reagents) - 1 dia cada
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
(12, 46376, 1),  -- Flask of the Frost Wyrm
(12, 46378, 1),  -- Flask of Pure Mojo
(12, 46379, 1),  -- Flask of Stoneblood
(12, 46377, 1),  -- Flask of Endless Rage
(12, 40211, 1),  -- Potion of Speed
(12, 40212, 1),  -- Potion of Wild Magic
(12, 33447, 1),  -- Runic Healing Potion
(12, 33448, 1),  -- Runic Mana Potion
(12, 43015, 1),  -- Fish Feast
(12, 40109, 1),  -- Elixir of Mighty Mageblood
(12, 39666, 1),  -- Elixir of Mighty Agility
(12, 40078, 1),  -- Elixir of Mighty Fortitude
(12, 40068, 1),  -- Wrath Elixir
(12, 40070, 1),  -- Spellpower Elixir
(12, 40076, 1);  -- Guru's Elixir

-- ============================================================
-- Type 13: Escudos/Off-hands (Shields & Off-hands)
-- ============================================================
INSERT INTO `mod_vip_shop` (`vendor_type`, `item_entry`, `price`) VALUES
-- ICC 25H (ilvl 277) - 5 dias
(13, 50616, 5),  -- Bulwark of Smouldering Steel (Shield)
(13, 50729, 5),  -- Icecrown Glacial Wall (Shield)
(13, 50635, 5),  -- Sundial of Eternal Dusk (Off-hand)
(13, 50719, 5),  -- Shadow Silk Spindle (Off-hand)
-- ICC 25N (ilvl 264) - 3 dias
(13, 49976, 3),  -- Bulwark of Smouldering Steel (Shield)
(13, 50065, 3),  -- Icecrown Glacial Wall (Shield)
(13, 50423, 3),  -- Sundial of Eternal Dusk (Off-hand)
(13, 50173, 3),  -- Shadow Silk Spindle (Off-hand)
(13, 51922, 3),  -- Scourgelord's Baton (Off-hand)
(13, 51909, 3),  -- Neverending Winter (Shield)
(13, 51812, 3);  -- Lost Pavise of the Blue Flight (Shield)
