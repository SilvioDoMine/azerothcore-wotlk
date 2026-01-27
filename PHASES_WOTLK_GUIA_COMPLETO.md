# Guia Completo de Phases - WotLK AzerothCore

Este documento expande o sistema de phases para incluir **PvP, PvE, Profissões e Quests**.

## Resumo das Phases do WotLK

| Phase | Conteúdo Principal | Arena Season | Emblems | Tier | Dungeons |
|-------|-------------------|--------------|---------|------|----------|
| **Phase 1** | Naxx, EoE, OS | S5 (Deadly) | Heroism, Valor | T7 | Todas originais |
| **Phase 2** | Ulduar | S6 (Furious) | Conquest | T8 | - |
| **Phase 3** | ToC, Onyxia 80, Argent Tournament | S7 (Relentless) | Triumph | T9 | Trial of Champion |
| **Phase 4** | ICC, Ruby Sanctum | S8 (Wrathful) | Frost | T10 | Frozen Halls (3) |

---

## Scripts SQL Disponíveis

| Arquivo | Descrição |
|---------|-----------|
| `phase1_wotlk_completo.sql` | Configuração inicial Phase 1 (remove conteúdo futuro) |
| `phase2_wotlk_ulduar.sql` | Progressão para Phase 2 |
| `phase3_wotlk_toc.sql` | Progressão para Phase 3 |
| `phase4_wotlk_icc.sql` | Progressão para Phase 4 (conteúdo completo) |

---

## 1. PVE - Raids por Phase

### Phase 1 - Disponíveis
| Raid | Map ID | Dificuldades | Item Level |
|------|--------|--------------|------------|
| Naxxramas | 533 | 10N, 25N | 200-213 |
| Eye of Eternity | 616 | 10N, 25N | 213-226 |
| Obsidian Sanctum | 615 | 10N, 25N | 200-213 |
| Vault of Archavon | 624 | 10N, 25N | Variado |

### Phase 2 - Adicionado
| Raid | Map ID | Dificuldades | Item Level |
|------|--------|--------------|------------|
| Ulduar | 603 | 10N, 10H, 25N, 25H | 219-252 |

### Phase 3 - Adicionado
| Raid | Map ID | Dificuldades | Item Level |
|------|--------|--------------|------------|
| Trial of the Crusader | 649 | 10N, 10H, 25N, 25H | 232-258 |
| Onyxia's Lair (80) | 249 | 10N, 25N | 232-245 |

### Phase 4 - Adicionado
| Raid | Map ID | Dificuldades | Item Level |
|------|--------|--------------|------------|
| Icecrown Citadel | 631 | 10N, 10H, 25N, 25H | 251-284 |
| Ruby Sanctum | 724 | 10N, 10H, 25N, 25H | 258-284 |

---

## 2. PVE - Dungeons por Phase

### Phase 1 - Disponíveis (16 Dungeons)
| Dungeon | Map ID | Heroic |
|---------|--------|--------|
| Utgarde Keep | 574 | ✅ |
| The Nexus | 576 | ✅ |
| Azjol-Nerub | 601 | ✅ |
| Ahn'kahet | 619 | ✅ |
| Drak'Tharon Keep | 600 | ✅ |
| Violet Hold | 608 | ✅ |
| Gundrak | 604 | ✅ |
| Halls of Stone | 599 | ✅ |
| Halls of Lightning | 602 | ✅ |
| The Oculus | 578 | ✅ |
| Utgarde Pinnacle | 575 | ✅ |
| Culling of Stratholme | 595 | ✅ |

### Phase 3 - Adicionado
| Dungeon | Map ID | Heroic |
|---------|--------|--------|
| Trial of the Champion | 650 | ✅ |

### Phase 4 - Adicionado (Frozen Halls)
| Dungeon | Map ID | Heroic |
|---------|--------|--------|
| Forge of Souls | 632 | ✅ |
| Pit of Saron | 658 | ✅ |
| Halls of Reflection | 668 | ✅ |

---

## 3. Emblems por Phase

### Comportamento Original Blizzard

| Phase | Heroics | Raid 10 | Raid 25 |
|-------|---------|---------|---------|
| Phase 1 | Heroism | Heroism | Valor |
| Phase 2 | Conquest | Conquest | Conquest |
| Phase 3 | Triumph | Triumph | Triumph |
| Phase 4 | Frost (daily) + Triumph | Frost | Frost |

### IDs dos Emblems
| Emblem | Item ID | Phase |
|--------|---------|-------|
| Emblem of Heroism | 40752 | 1 |
| Emblem of Valor | 40753 | 1 |
| Emblem of Conquest | 45624 | 2 |
| Emblem of Triumph | 47241 | 3 |
| Emblem of Frost | 49426 | 4 |

---

## 4. Profissões por Phase

### Phase 1 - Receitas Disponíveis
- Todas receitas base de WotLK
- Mats: Titansteel, Moonshroud, Ebonweave, Spellweave
- Item Level máximo craftável: ~200-213

### Phase 2 - Adicionado
- Receitas de Ulduar drops
- Runed Orb como mat de craft
- Item Level: até 226

### Phase 3 - Adicionado
- Receitas de ToC drops
- Crusader Orb como mat de craft
- Item Level: até 245

### Phase 4 - Adicionado
- Receitas de ICC drops
- Primordial Saronite como mat de craft
- Ashen Verdict recipes
- Item Level: até 264

### Receitas Especiais por Phase

| Item/Pattern | Profissão | Phase | Drops em |
|--------------|-----------|-------|----------|
| Plans: Spiked Deathdealers | Blacksmithing | 2 | Ulduar |
| Plans: Treads of Destiny | Blacksmithing | 3 | ToC |
| Plans: Boots of Kingly Upheaval | Blacksmithing | 4 | ICC (Ashen Verdict) |
| Pattern: Cord of the Merciless | Tailoring | 3 | ToC |
| Pattern: Lightweave Leggings | Tailoring | 4 | ICC |

---

## 5. Quests por Phase

### Phase 1 - Disponíveis
- Todas quests de leveling Northrend
- Dailies de Sons of Hodir
- Dailies de Kalu'ak
- Dalaran dailies (Cooking, Fishing, Jewelcrafting)
- Weekly dungeon quests

### Phase 2 - Adicionado
- Ulduar attunement chain (opcional)
- Algalon questline
- Herald of the Titans related

### Phase 3 - Adicionado
- **Argent Tournament** (Crusader dailies)
- ToC intro quests
- Black Knight questline

### Phase 4 - Adicionado
- ICC intro questline
- **Shadowmourne** questline
- **Quel'Delar** (Battered Hilt) questline
- Frozen Halls story quests
- Weekly ICC raid quests

### Quests por Zone/ID

```sql
-- Argent Tournament (Phase 3) - IDs principais
-- 13667-13694: Aspirant/Valiant/Champion chains
-- 13795-13803: Crusader quests

-- ICC (Phase 4) - IDs principais
-- 24500-24508: Intro quests
-- 24545-24552: Inside ICC
-- 24743-24827: Shadowmourne
-- 24476-24561: Quel'Delar
```

---

## 6. NPCs Importantes por Phase

### Vendors de Emblem

| NPC | Entry | Emblem | Phase |
|-----|-------|--------|-------|
| Arcanist Ivrenne | 31580 | Heroism | 1 |
| Magistrix Lambriesse | 31582 | Heroism | 1 |
| Arcanist Adurin | 31579 | Valor | 1 |
| Magister Brasael | 31581 | Valor | 1 |
| Arcanist Firael | 33964 | Conquest | 2 |
| Magister Sarien | 33963 | Conquest | 2 |
| Arcanist Asarina | 35573 | Triumph | 3 |
| Magistrix Iruvia | 35574 | Triumph | 3 |
| Arcanist Uovril | 37942 | Frost | 4 |
| Magister Arlan | 37941 | Frost | 4 |

### NPCs do Argent Tournament (Phase 3)

| NPC | Entry | Função |
|-----|-------|--------|
| Dame Evniki Kapsalis | 34885 | Crusader's Quartermaster |
| Justicar Mariel Trueheart | 33817 | Quest Giver |
| Argent Confessor Paletress | 33759 | Champion NPC |

### NPCs do ICC (Phase 4)

| NPC | Entry | Função |
|-----|-------|--------|
| Lady Jaina Proudmoore | 37597 | Alliance Leader |
| Lady Sylvanas Windrunner | 37596 | Horde Leader |
| Highlord Tirion Fordring | 37580 | Quest/Story |
| Crok Scourgebane | 36856 | Quest Giver |

---

## 7. Game Events de Arena

| Event ID | Arena Season | Itens |
|----------|--------------|-------|
| 57 | Season 5 | Deadly/Hateful/Savage |
| 58 | Season 6 | Furious |
| 59 | Season 7 | Relentless |
| 60 | Season 8 | Wrathful |

### Controle via Console GM
```
.event start 57  -- Ativar Season 5
.event stop 58   -- Desativar Season 6
.event info 57   -- Ver status do evento
```

---

## 8. Comandos de Verificação

### Verificar Raids/Dungeons Bloqueadas
```sql
SELECT entry, comment FROM disables WHERE sourceType = 2;
```

### Verificar Arena Events Ativos
```sql
SELECT eventEntry, description,
       CASE WHEN NOW() BETWEEN start_time AND end_time THEN 'ATIVO' ELSE 'INATIVO' END as status
FROM game_event
WHERE eventEntry IN (57, 58, 59, 60);
```

### Verificar Vendors de Emblem Spawned
```sql
SELECT c.guid, ct.entry, ct.name, ct.subname
FROM creature c
JOIN creature_template ct ON c.id1 = ct.entry
WHERE ct.subname LIKE '%Emblem%';
```

### Verificar Quests Bloqueadas
```sql
SELECT ID, LogTitle, AllowableRaces
FROM quest_template
WHERE AllowableRaces = 0
AND ID BETWEEN 13600 AND 25000;
```

### Contar Itens de Arena por Season
```sql
SELECT
  CASE
    WHEN name LIKE '%Savage%Gladiator%' THEN 'Season 5 - Savage'
    WHEN name LIKE '%Hateful%Gladiator%' THEN 'Season 5 - Hateful'
    WHEN name LIKE '%Deadly%Gladiator%' THEN 'Season 5 - Deadly'
    WHEN name LIKE '%Furious%Gladiator%' THEN 'Season 6 - Furious'
    WHEN name LIKE '%Relentless%Gladiator%' THEN 'Season 7 - Relentless'
    WHEN name LIKE '%Wrathful%Gladiator%' THEN 'Season 8 - Wrathful'
  END as Season,
  COUNT(*) as Quantidade
FROM item_template
WHERE name LIKE '%Gladiator%'
GROUP BY Season
HAVING Season IS NOT NULL;
```

---

## 9. Considerações Importantes

### Backup
Sempre faça backup antes de aplicar qualquer script:
```bash
mysqldump -u root -p acore_world > backup_world_$(date +%Y%m%d).sql
mysqldump -u root -p acore_characters > backup_characters_$(date +%Y%m%d).sql
```

### Reinício do Servidor
Após aplicar scripts SQL, reinicie o worldserver:
```bash
# Se usando systemd
sudo systemctl restart worldserver

# Se executando manualmente
# Ctrl+C no console e reiniciar
```

### Progressão Reversa
Para voltar a uma phase anterior, você precisará:
1. Restaurar os backups do banco
2. Ou reimportar os dados originais do AzerothCore
3. Aplicar novamente o script da phase desejada

### Loot Tables
Os scripts de progressão comentam a restauração de loot tables.
Para reimportar, use os SQLs originais do AzerothCore ou restaure do backup.

---

## 10. Ordem de Execução

### Para configurar Phase 1 (servidor novo):
```bash
mysql -u root -p acore_world < phase1_wotlk_completo.sql
```

### Para progredir para Phase 2:
```bash
mysql -u root -p acore_world < phase2_wotlk_ulduar.sql
```

### Para progredir para Phase 3:
```bash
mysql -u root -p acore_world < phase3_wotlk_toc.sql
```

### Para Phase 4 (conteúdo completo):
```bash
mysql -u root -p acore_world < phase4_wotlk_icc.sql
```

---

*Documento gerado em 2026-01-26*
*Compatível com AzerothCore WotLK 3.3.5a*
