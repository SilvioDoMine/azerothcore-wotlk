# Plano: VIP Shop - NPCs Gossip para Compra de Itens com Tokens VIP

## Contexto
Adicionar um sistema de loja VIP ao mod-vip-system existente. Jogadores usam tokens VIP (item 18154) no inventario como moeda para comprar equipamentos e consumiveis endgame de NPCs gossip. Cada NPC representa uma categoria de itens (armas, elmos, peitorais, etc.). Itens de equipamento sao filtrados por classe/raca do jogador.

## Arquivos Novos

| Arquivo | Descricao |
|---------|-----------|
| `src/VipShop.h` | Singleton VipShop: estruturas de dados, cache, declaracoes |
| `src/VipShop.cpp` | LoadFromDB, TryPurchase, BuildItemLink, GetFilteredItems |
| `src/VipShopCreatureScript.cpp` | CreatureScript "npc_vip_shop" com maquina de estados do gossip |
| `data/sql/db-world/base/mod_vip_shop.sql` | Tabelas, NPCs creature_template, npc_text, itens pre-populados |

## Arquivos Modificados

| Arquivo | Mudanca |
|---------|---------|
| `src/mod_vip_system_loader.cpp` | Registrar AddVipShopCreatureScript() |
| `src/VipSystemWorldScript.cpp` | Chamar sVipShop->LoadConfig() e sVipShop->LoadFromDB() no OnAfterConfigLoad |
| `conf/mod_vip_system.conf.dist` | Adicionar VipSystem.ShopEnable |

## Design do Banco de Dados

### Tabela `mod_vip_shop` (world DB)
```sql
CREATE TABLE IF NOT EXISTS `mod_vip_shop` (
  `vendor_type` TINYINT UNSIGNED NOT NULL,
  `item_entry`  INT UNSIGNED NOT NULL,
  `price`       INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`vendor_type`, `item_entry`)
);
```

### Tabela `mod_vip_shop_npc` (world DB)
```sql
CREATE TABLE IF NOT EXISTS `mod_vip_shop_npc` (
  `creature_entry` INT UNSIGNED NOT NULL,
  `vendor_type`    TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`creature_entry`)
);
```

### Categorias (vendor_type)
| Tipo | Categoria | Creature Entry |
|------|-----------|----------------|
| 1 | Armas | 200001 |
| 2 | Elmos | 200002 |
| 3 | Ombros | 200003 |
| 4 | Peitorais | 200004 |
| 5 | Pernas | 200005 |
| 6 | Pes | 200006 |
| 7 | Maos | 200007 |
| 8 | Pulsos | 200008 |
| 9 | Cintura | 200009 |
| 10 | Capas | 200010 |
| 11 | Aneis/Amuletos/Trinkets | 200011 |
| 12 | Consumiveis/Reagentes | 200012 |
| 13 | Escudos/Off-hands | 200013 |

Todos NPCs com `ScriptName = 'npc_vip_shop'`, `npcflag = 1` (GOSSIP).

## Design C++

### VipShop Singleton (`VipShop.h`/`.cpp`)
- Cache: `_shopItems` (vendor_type -> vector<VipShopItem>), `_npcTypeMap` (creature_entry -> vendor_type)
- `LoadFromDB()`: Query `mod_vip_shop` JOIN `item_template` + query `mod_vip_shop_npc`. Valida items existem.
- `GetFilteredItems(vendorType, player)`: Para equips, usa `player->CanUseItem(proto) == EQUIP_ERR_OK` para filtrar. Para consumiveis, retorna todos.
- `BuildItemLink(entry, name, quality)`: Gera `|cffCOLOR|Hitem:ENTRY:0:0:0:0:0:0:80|h[NAME]|h|r`
- `TryPurchase(player, itemEntry, price)`: Verifica tokens no inventario (`GetItemCount(tokenEntry, false)`), verifica espaco (`CanStoreNewItem`), remove tokens (`DestroyItemCount`), da item (`StoreNewItem`)

### CreatureScript (`VipShopCreatureScript.cpp`)
Um unico CreatureScript "npc_vip_shop" para todos os NPCs. Estado por jogador armazenado em mapa:

```cpp
struct VipShopPlayerState {
    uint8 vendorType;
    uint32 currentPage;
    uint32 selectedItemIndex;
    std::vector<VipShopItem const*> filteredItems;
};
std::unordered_map<uint32/*guid*/, VipShopPlayerState> _playerStates;
```

### Fluxo do Gossip (Maquina de Estados)

```
OnGossipHello
    |-> Busca vendor_type pelo creature entry
    |-> Filtra itens para o jogador
    |-> Se nenhum item disponivel: msg "Nenhum item disponivel para sua classe"
    |-> Se tem itens: mostra pagina 0 da lista

SENDER_ITEM_LIST (sender=1):
    action 0..27 = seleciona item na pagina
        |-> Calcula indice global = page * 28 + action
        |-> Envia item link no chat (PSendSysMessage)
        |-> Mostra menu: "Comprar por X dia(s) VIP" | "Voltar"
    action 9990 = proxima pagina
    action 9991 = pagina anterior

SENDER_ITEM_DETAIL (sender=2):
    action 9992 (BUY) -> Mostra confirmacao:
        "Confirmar: Gastar X dia(s) VIP por [Item]? (Voce tem Y tokens)"
        "Confirmar Compra" | "Cancelar"
    action 9993 (BACK) -> Volta para lista na pagina atual

SENDER_CONFIRM (sender=3):
    action 9994 (CONFIRM) -> Executa compra via TryPurchase()
        Sucesso: msg verde + fecha gossip
        Falha: msg vermelha + fecha gossip
    action 9995 (CANCEL) -> Volta para lista
```

28 itens por pagina + 2 slots para navegacao (max 30 entradas gossip).

### Texto do NPC (npc_text 200001)
"Bem-vindo a Loja VIP! Selecione um item para visualizar detalhes e comprar com seus dias VIP."

## Itens Pre-populados
Consultar o banco `item_template` do AzerothCore para encontrar itens reais de ICC 25N/25H e ToC 25H (ilvl 245-284). Incluir ~10-20 itens por categoria cobrindo todas as classes. Precos sugeridos:
- ilvl 277-284 (ICC 25H): 5-7 dias
- ilvl 264 (ICC 25N): 3-4 dias
- ilvl 245-258 (ToC 25H / ICC 10): 2-3 dias
- Consumiveis/reagentes: 1 dia

## Sequencia de Implementacao
1. Criar `VipShop.h` e `VipShop.cpp`
2. Criar `VipShopCreatureScript.cpp`
3. Modificar `mod_vip_system_loader.cpp` e `VipSystemWorldScript.cpp`
4. Atualizar `mod_vip_system.conf.dist`
5. Criar SQL com tabelas, NPCs e itens (consultando DB para IDs reais)
6. Build: `cd build && cmake .. && make -j$(nproc) && make install`
7. Importar SQL no world DB

## Verificacao
1. Build sem erros
2. Server inicia e loga "mod-vip-system: VipShop loaded X items across Y categories"
3. Spawn NPC com `.npc add 200001` (armas)
4. Testar gossip: ver lista filtrada por classe, paginacao, item link no chat
5. Testar compra: confirmacao, remocao de tokens, recebimento do item
6. Testar sem tokens: mensagem de erro adequada
7. Testar classe errada: verificar que itens de outra classe nao aparecem
8. Testar inventario cheio: mensagem de erro
