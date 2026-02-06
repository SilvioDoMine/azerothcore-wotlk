#include "VipShop.h"
#include "VipSystem.h"

#include "Chat.h"
#include "Config.h"
#include "DatabaseEnv.h"
#include "Item.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Player.h"

VipShop* VipShop::instance()
{
    static VipShop inst;
    return &inst;
}

void VipShop::LoadConfig()
{
    _enabled = sConfigMgr->GetOption<bool>("VipSystem.ShopEnable", true);
}

void VipShop::LoadFromDB()
{
    if (!_enabled)
    {
        LOG_INFO("module", "mod-vip-system: VipShop disabled by config");
        return;
    }

    _shopItems.clear();
    _npcTypeMap.clear();

    // Load NPC -> vendor_type mapping
    QueryResult npcResult = WorldDatabase.Query("SELECT creature_entry, vendor_type FROM mod_vip_shop_npc");
    if (npcResult)
    {
        do
        {
            Field* fields = npcResult->Fetch();
            uint32 creatureEntry = fields[0].Get<uint32>();
            uint8 vendorType = fields[1].Get<uint8>();
            _npcTypeMap[creatureEntry] = vendorType;
        } while (npcResult->NextRow());
    }

    // Load shop items
    QueryResult itemResult = WorldDatabase.Query("SELECT vendor_type, item_entry, price FROM mod_vip_shop");
    if (!itemResult)
    {
        LOG_INFO("module", "mod-vip-system: VipShop loaded 0 items (table empty or missing)");
        return;
    }

    uint32 totalItems = 0;
    do
    {
        Field* fields = itemResult->Fetch();
        uint8 vendorType = fields[0].Get<uint8>();
        uint32 itemEntry = fields[1].Get<uint32>();
        uint32 price = fields[2].Get<uint32>();

        ItemTemplate const* proto = sObjectMgr->GetItemTemplate(itemEntry);
        if (!proto)
        {
            LOG_ERROR("module", "mod-vip-system: VipShop item {} does not exist in item_template, skipping", itemEntry);
            continue;
        }

        VipShopItem item;
        item.itemEntry = itemEntry;
        item.price = price;
        item.name = proto->Name1;
        item.quality = proto->Quality;

        _shopItems[vendorType].push_back(item);
        totalItems++;
    } while (itemResult->NextRow());

    LOG_INFO("module", "mod-vip-system: VipShop loaded {} items across {} categories",
        totalItems, _shopItems.size());
}

uint8 VipShop::GetVendorType(uint32 creatureEntry) const
{
    auto it = _npcTypeMap.find(creatureEntry);
    if (it != _npcTypeMap.end())
        return it->second;
    return 0;
}

std::vector<VipShopItem const*> VipShop::GetFilteredItems(uint8 vendorType, Player* player) const
{
    std::vector<VipShopItem const*> result;

    auto it = _shopItems.find(vendorType);
    if (it == _shopItems.end())
        return result;

    // GM on (.gm on) = show all items, GM off = filter by class/race
    bool bypassFilter = player->IsGameMaster();

    for (auto const& item : it->second)
    {
        ItemTemplate const* proto = sObjectMgr->GetItemTemplate(item.itemEntry);
        if (!proto)
            continue;

        // GM bypass or consumables: no filter
        if (bypassFilter || vendorType == 12)
        {
            result.push_back(&item);
            continue;
        }

        // Equipment: check class and race only (ignore level/skill requirements)
        if ((proto->AllowableClass & player->getClassMask()) && (proto->AllowableRace & player->getRaceMask()))
            result.push_back(&item);
    }

    return result;
}

std::string VipShop::BuildItemLink(uint32 entry, std::string const& name, uint8 quality)
{
    // WoW item quality color codes
    static const char* qualityColors[] = {
        "ff9d9d9d", // 0 POOR (gray)
        "ffffffff", // 1 NORMAL (white)
        "ff1eff00", // 2 UNCOMMON (green)
        "ff0070dd", // 3 RARE (blue)
        "ffa335ee", // 4 EPIC (purple)
        "ffff8000", // 5 LEGENDARY (orange)
        "ffe6cc80", // 6 ARTIFACT (light yellow)
        "ffe6cc80", // 7 HEIRLOOM (light yellow)
    };

    const char* color = (quality < 8) ? qualityColors[quality] : qualityColors[1];

    // Format: |cCOLOR|Hitem:ENTRY:0:0:0:0:0:0:0:80|h[NAME]|h|r
    return "|c" + std::string(color) + "|Hitem:" + std::to_string(entry) +
           ":0:0:0:0:0:0:0:80|h[" + name + "]|h|r";
}

bool VipShop::TryPurchase(Player* player, uint32 itemEntry, uint32 price)
{
    uint32 tokenEntry = sVipSystem->GetConfig().ItemEntry;

    // Check player has enough tokens
    uint32 tokenCount = player->GetItemCount(tokenEntry, false);
    if (tokenCount < price)
    {
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cffff0000[Loja VIP]|r Voce nao possui tokens suficientes. Necessario: {} | Disponivel: {}",
            price, tokenCount);
        return false;
    }

    // Check item exists
    ItemTemplate const* proto = sObjectMgr->GetItemTemplate(itemEntry);
    if (!proto)
    {
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cffff0000[Loja VIP]|r Item invalido.");
        return false;
    }

    // Check inventory space
    ItemPosCountVec dest;
    InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, itemEntry, 1);
    if (msg != EQUIP_ERR_OK)
    {
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cffff0000[Loja VIP]|r Seu inventario esta cheio. Libere espaco e tente novamente.");
        return false;
    }

    // Remove tokens
    player->DestroyItemCount(tokenEntry, price, true);

    // Give item
    Item* item = player->StoreNewItem(dest, itemEntry, true);
    if (item)
        player->SendNewItem(item, 1, true, false);

    ChatHandler(player->GetSession()).PSendSysMessage(
        "|cff00ff00[Loja VIP]|r Compra realizada com sucesso! Voce recebeu {}.",
        BuildItemLink(itemEntry, proto->Name1, proto->Quality));

    return true;
}
