# NPCs para Ajustar - Phase 1 WotLK

Este documento lista todos os NPCs que precisam ser ajustados para adequar seu servidor AzerothCore à **Phase 1 do Wrath of the Lich King**.

## Resumo das Phases do WotLK

| Phase | Conteúdo | Arena Season | Emblems | Tier |
|-------|----------|--------------|---------|------|
| **Phase 1** | Naxxramas, Eye of Eternity, Obsidian Sanctum | Season 5 (Deadly/Hateful/Savage) | Heroism, Valor | T7 |
| Phase 2 | Ulduar | Season 6 (Furious) | Conquest | T8 |
| Phase 3 | Trial of the Crusader, Onyxia | Season 7 (Relentless) | Triumph | T9 |
| Phase 4 | Icecrown Citadel | Season 8 (Wrathful) | Frost | T10 |

---

## 1. NPCs de Arena Season (Controlados por Game Events)

### Como Funciona
O AzerothCore já possui um sistema de eventos para controlar os NPCs de Arena por season:
- **Event 57**: Arena Season 5 (Phase 1) ✅
- **Event 58**: Arena Season 6 (Phase 2)
- **Event 59**: Arena Season 7 (Phase 3)
- **Event 60**: Arena Season 8 (Phase 4)

### Ação Recomendada
Para Phase 1, você deve:
1. **Ativar** apenas o evento 57 (Season 5)
2. **Desativar** os eventos 58, 59, 60

```sql
-- Ativar Season 5 (Phase 1)
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2030-12-31 23:59:59' WHERE eventEntry = 57;

-- Desativar Season 6, 7, 8
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2000-01-01 00:00:01' WHERE eventEntry IN (58, 59, 60);
```

### NPCs Controlados - Season 6 (DESATIVAR)

| Entry | Nome | Função |
|-------|------|--------|
| 33915 | Argex Irongut | Veteran Arena Vendor |
| 33916 | Big Zokk Torquewrench | Arena Vendor |
| 34088 | Blazzek the Biter | Exceptional Arena Weaponry |
| 33917 | Ecton Brasstumbler | Apprentice Arena Vendor |
| 33920 | Evee Copperspring | Arena Vendor |
| 34089 | Grex Brainboiler | Exceptional Arena Weaponry |
| 33918 | Kezzik the Striker | Veteran Arena Vendor |
| 33919 | Leeni "Smiley" Smalls | Apprentice Arena Vendor |
| 33921 | Nargle Lashcord | Veteran Arena Vendor |
| 34087 | Trapjaw Rix | Exceptional Arena Weaponry |
| 33922 | Xazi Smolderpipe | Arena Vendor |
| 33923 | Zom Bocom | Apprentice Arena Vendor |

### NPCs Controlados - Season 7 (DESATIVAR)

| Entry | Nome | Função |
|-------|------|--------|
| 33924 | Argex Irongut | Veteran Arena Vendor |
| 33932 | Big Zokk Torquewrench | Arena Vendor |
| 34090 | Blazzek the Biter | Exceptional Arena Weaponry |
| 33929 | Ecton Brasstumbler | Apprentice Arena Vendor |
| 33928 | Evee Copperspring | Arena Vendor |
| 34091 | Grex Brainboiler | Exceptional Arena Weaponry |
| 33931 | Kezzik the Striker | Veteran Arena Vendor |
| 33930 | Leeni "Smiley" Smalls | Apprentice Arena Vendor |
| 33927 | Nargle Lashcord | Veteran Arena Vendor |
| 34092 | Trapjaw Rix | Exceptional Arena Weaponry |
| 33926 | Xazi Smolderpipe | Arena Vendor |
| 33925 | Zom Bocom | Apprentice Arena Vendor |

### NPCs Controlados - Season 8 (DESATIVAR)

| Entry | Nome | Função |
|-------|------|--------|
| 33939 | Argex Irongut | Veteran Arena Vendor |
| 33933 | Big Zokk Torquewrench | Arena Vendor |
| 34093 | Blazzek the Biter | Exceptional Arena Weaponry |
| 33934 | Ecton Brasstumbler | Apprentice Arena Vendor |
| 33935 | Evee Copperspring | Arena Vendor |
| 34094 | Grex Brainboiler | Exceptional Arena Weaponry |
| 33940 | Kezzik the Striker | Veteran Arena Vendor |
| 33941 | Leeni "Smiley" Smalls | Apprentice Arena Vendor |
| 33936 | Nargle Lashcord | Veteran Arena Vendor |
| 34095 | Trapjaw Rix | Exceptional Arena Weaponry |
| 33937 | Xazi Smolderpipe | Arena Vendor |
| 33938 | Zom Bocom | Apprentice Arena Vendor |

---

## 2. NPCs de Emblems (Precisam Remoção Manual)

### NPCs para DESATIVAR Completamente

Estes vendors vendem items de phases posteriores e devem ser desativados:

| Entry | Nome | Função | Razão |
|-------|------|--------|-------|
| 33964 | Arcanist Firael | Emblem of Conquest QM | Phase 2 - Ulduar |
| 33963 | Magister Sarien | Emblem of Conquest QM | Phase 2 - Ulduar |
| 35573 | Arcanist Asarina | Emblem of Triumph QM | Phase 3 - ToC |
| 35494 | Arcanist Miluria | Emblem of Triumph QM | Phase 3 - ToC |
| 35574 | Magistrix Iruvia | Emblem of Triumph QM | Phase 3 - ToC |
| 35495 | Magistrix Vesara | Emblem of Triumph QM | Phase 3 - ToC |
| 37942 | Arcanist Uovril | Emblem of Frost QM | Phase 4 - ICC |
| 38858 | Goodman the "Closer" | Emblem of Frost QM | Phase 4 - ICC |
| 37941 | Magister Arlan | Emblem of Frost QM | Phase 4 - ICC |

```sql
-- Opção 1: Remover spawn dos NPCs de Emblems de phases futuras
DELETE FROM creature WHERE id1 IN (33964, 33963, 35573, 35494, 35574, 35495, 37942, 38858, 37941);

-- Opção 2: Alternativamente, remover flag de vendor (mantém NPC mas não vende nada)
UPDATE creature_template SET npcflag = npcflag & ~128 WHERE entry IN (33964, 33963, 35573, 35494, 35574, 35495, 37942, 38858, 37941);
```

### NPCs de Emblem para MANTER (Phase 1)

| Entry | Nome | Função |
|-------|------|--------|
| 31580 | Arcanist Ivrenne | Emblem of Heroism QM ✅ |
| 31582 | Magistrix Lambriesse | Emblem of Heroism QM ✅ |
| 31579 | Arcanist Adurin | Emblem of Valor QM ✅ |
| 31581 | Magister Brasael | Emblem of Valor QM ✅ |

---

## 3. Vendors de Tier Sets (Precisam Remoção Manual)

### Vendors de T10 (ICC) - DESATIVAR

| Entry | Nome | Função |
|-------|------|--------|
| 37999 | Alana Moonstrike | Druid Armor (T10) |
| 37688 | Crusader Grimtong | Warrior Armor (T10) |
| 37696 | Crusader Halford | Paladin Armor (T10) |
| 37993 | Gerardo the Suave | Hunter Armor (T10) |
| 38181 | Haragg the Unseen | Warlock Armor (T10) |
| 35498 | Horace Hunderland | Plate Armor (T10) |
| 37991 | Ikfirus the Vile | Rogue Armor (T10) |
| 38840 | Jedebia | Shaman Armor (T10) |
| 38283 | Malfus Grimfrost | Mage Armor (T10) |
| 35500 | Matilda Brightlink | Mail Armor (T10) |
| 38182 | Niby the Almighty | Warlock Armor (T10) |
| 38316 | Ormus the Penitent | Death Knight Armor (T10) |
| 35497 | Rafael Langrom | Leather Armor (T10) |
| 35496 | Rueben Lauren | Cloth Armor (T10) |
| 38054 | Scott the Merciful | Priest Armor (T10) |
| 37998 | Talan Moonstrike | Hunter Armor (T10) |
| 37992 | Tortunok | Druid Armor (T10) |
| 38284 | Uvlus Banefire | Mage Armor (T10) |
| 38841 | Vol'guk | Shaman Armor (T10) |
| 37997 | Yili | Rogue Armor (T10) |

```sql
-- Remover spawns de vendors T10
DELETE FROM creature WHERE id1 IN (37999, 37688, 37696, 37993, 38181, 35498, 37991, 38840, 38283, 35500, 38182, 38316, 35497, 35496, 38054, 37998, 37992, 38284, 38841, 37997);
```

### Vendors de T9 (ToC) - DESATIVAR

| Entry | Nome | Função |
|-------|------|--------|
| 35579 | Aspirant Forudir | Triumphant Armor Vendor |
| 35580 | Aspirant Naradiel | Triumphant Armor Vendor |
| 35576 | Champion Faesrol | Triumphant Armor Vendor |
| 35575 | Champion Isimode | Triumphant Armor Vendor |
| 35578 | Valiant Bressia | Triumphant Armor Vendor |
| 35577 | Valiant Laradia | Triumphant Armor Vendor |

```sql
-- Remover spawns de vendors T9
DELETE FROM creature WHERE id1 IN (35579, 35580, 35576, 35575, 35578, 35577);
```

### Vendors de T8 (Ulduar) - DESATIVAR

| Entry | Nome | Função |
|-------|------|--------|
| 29523 | Bragund Brightlink | Mail Armor (T8) |
| 34252 | Dubin Clay | Plate Armor (T8) |
| 28995 | Paldesse | Cloth Armor (T8) |
| 28992 | Valerie Langrom | Leather Armor (T8) |

```sql
-- Remover spawns de vendors T8 (Ulduar)
DELETE FROM creature WHERE id1 IN (29523, 34252, 28995, 28992);
```

---

## 4. Vendors de Honor/PvP com Itens Incorretos

Estes vendors vendem itens Season 5 E de seasons posteriores. É necessário remover os itens das seasons 6-8 da lista de venda:

| Entry | Nome | Itens S6 | Itens S7 | Itens S8 |
|-------|------|----------|----------|----------|
| 34063 | Blood Guard Zar'shi | 89 | 0 | 0 |
| 34074 | Captain Dirgehammer | 47 | 0 | 0 |
| 34075 | Captain Dirgehammer | 0 | 50 | 0 |
| 34058 | Doris Volanthius | 47 | 0 | 0 |
| 34059 | Doris Volanthius | 0 | 50 | 0 |
| 34060 | Doris Volanthius | 0 | 0 | 50 |
| 34084 | Knight-Lieutenant Moonstrike | 89 | 0 | 0 |
| 40607 | Knight-Lieutenant T'Maire Sydes | 89 | 0 | 0 |
| 34076 | Lieutenant Tristia | 47 | 0 | 0 |
| 34077 | Lieutenant Tristia | 0 | 50 | 0 |
| 34078 | Lieutenant Tristia | 0 | 0 | 50 |
| 34037 | Sergeant Thunderhorn | 47 | 0 | 0 |
| 34038 | Sergeant Thunderhorn | 0 | 50 | 0 |

```sql
-- Remover itens Furious (Season 6) dos vendors
DELETE nv FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE nv.entry IN (34063, 34074, 34058, 34084, 40607, 34076, 34037)
AND it.name LIKE '%Furious%Gladiator%';

-- Remover itens Relentless (Season 7) dos vendors
DELETE nv FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE nv.entry IN (34075, 34059, 34077, 34038)
AND it.name LIKE '%Relentless%Gladiator%';

-- Remover itens Wrathful (Season 8) dos vendors
DELETE nv FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE nv.entry IN (34060, 34078)
AND it.name LIKE '%Wrathful%Gladiator%';
```

---

## 5. Argent Tournament (Phase 3+)

O Argent Tournament foi lançado na Phase 3. Para Phase 1, considere desativar:

### Dame Evniki Kapsalis (Crusader's Quartermaster)

| Entry | Nome | Função |
|-------|------|--------|
| 34885 | Dame Evniki Kapsalis | Crusader's Quartermaster |

```sql
-- Remover spawn do quartermaster do Argent Tournament
DELETE FROM creature WHERE id1 = 34885;
```

---

## 6. Script SQL Completo para Phase 1

Execute este script para configurar seu servidor para Phase 1:

```sql
-- ==========================================
-- CONFIGURAÇÃO PHASE 1 WOTLK - AZEROTHCORE
-- ==========================================

-- 1. Configurar eventos de Arena Season
-- Ativar Season 5 (Phase 1)
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2030-12-31 23:59:59' WHERE eventEntry = 57;

-- Desativar Season 6, 7, 8
UPDATE game_event SET start_time = '2000-01-01 00:00:00', end_time = '2000-01-01 00:00:01' WHERE eventEntry IN (58, 59, 60);

-- 2. Remover vendors de Emblems de phases futuras
DELETE FROM creature WHERE id1 IN (
    33964, 33963,  -- Emblem of Conquest (Phase 2)
    35573, 35494, 35574, 35495,  -- Emblem of Triumph (Phase 3)
    37942, 38858, 37941  -- Emblem of Frost (Phase 4)
);

-- 3. Remover vendors de T10 (ICC)
DELETE FROM creature WHERE id1 IN (
    37999, 37688, 37696, 37993, 38181, 35498, 37991, 38840,
    38283, 35500, 38182, 38316, 35497, 35496, 38054, 37998,
    37992, 38284, 38841, 37997
);

-- 4. Remover vendors de T9 (ToC)
DELETE FROM creature WHERE id1 IN (35579, 35580, 35576, 35575, 35578, 35577);

-- 5. Remover vendors de T8 (Ulduar)
DELETE FROM creature WHERE id1 IN (29523, 34252, 28995, 28992);

-- 6. Remover itens de PvP das seasons 6-8 dos vendors restantes
DELETE nv FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE it.name LIKE '%Furious%Gladiator%'
   OR it.name LIKE '%Relentless%Gladiator%'
   OR it.name LIKE '%Wrathful%Gladiator%';

-- 7. Remover Argent Tournament Quartermaster
DELETE FROM creature WHERE id1 = 34885;

-- ==========================================
-- FIM DA CONFIGURAÇÃO
-- ==========================================
```

---

## 7. Itens de PvP por Season (Referência)

| Season | Prefixo | Tier | Origem |
|--------|---------|------|--------|
| Season 5 | Savage Gladiator | Craftable | Profissões |
| Season 5 | Hateful Gladiator | Honor | Vendors de Honor |
| Season 5 | Deadly Gladiator | Arena | Rating + Arena Points |
| Season 6 | Furious Gladiator | Honor/Arena | Phase 2 |
| Season 7 | Relentless Gladiator | Honor/Arena | Phase 3 |
| Season 8 | Wrathful Gladiator | Honor/Arena | Phase 4 |

### Contagem de Itens no Banco

| Season | Quantidade |
|--------|------------|
| Season 5 - Savage (Craftable) | 137 |
| Season 5 - Hateful (Honor) | 178 |
| Season 5 - Deadly (Arena) | 174 |
| Season 6 - Furious | 203 |
| Season 7 - Relentless | 209 |
| Season 8 - Wrathful | 209 |

---

## 8. Verificação Pós-Configuração

Execute estas queries para verificar se a configuração está correta:

```sql
-- Verificar eventos de Arena ativos
SELECT eventEntry, description, start_time, end_time
FROM game_event
WHERE eventEntry IN (57, 58, 59, 60);

-- Verificar se não há vendors de seasons futuras
SELECT ct.entry, ct.name, ct.subname
FROM creature c
JOIN creature_template ct ON c.id1 = ct.entry
WHERE ct.subname LIKE '%Emblem of Conquest%'
   OR ct.subname LIKE '%Emblem of Triumph%'
   OR ct.subname LIKE '%Emblem of Frost%';

-- Verificar se não há itens de seasons 6-8 à venda
SELECT COUNT(*) as itens_incorretos
FROM npc_vendor nv
JOIN item_template it ON nv.item = it.entry
WHERE it.name LIKE '%Furious%Gladiator%'
   OR it.name LIKE '%Relentless%Gladiator%'
   OR it.name LIKE '%Wrathful%Gladiator%';
```

---

## Notas Importantes

1. **Backup**: Sempre faça backup do banco de dados antes de executar os scripts SQL.

2. **Reiniciar Servidor**: Após as alterações, reinicie o worldserver para aplicar as mudanças.

3. **Game Events**: Os eventos podem ser controlados in-game com comandos GM:
   ```
   .event start 57  -- Ativar Season 5
   .event stop 58   -- Desativar Season 6
   ```

4. **Progressão**: Para avançar para Phase 2, basta ativar o evento 58 e adicionar de volta os vendors correspondentes.

---

*Documento gerado automaticamente em 2026-01-26*
