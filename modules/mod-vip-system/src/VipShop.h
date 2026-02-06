#ifndef VIP_SHOP_H
#define VIP_SHOP_H

#include <string>
#include <unordered_map>
#include <vector>

#include "Common.h"

class Player;

struct VipShopItem
{
    uint32 itemEntry;
    uint32 price; // in VIP tokens (days)
    std::string name;
    uint8 quality;
};

class VipShop
{
public:
    static VipShop* instance();

    void LoadConfig();
    void LoadFromDB();

    bool IsEnabled() const { return _enabled; }

    // Get vendor type for a creature entry, 0 if not a shop NPC
    uint8 GetVendorType(uint32 creatureEntry) const;

    // Get items filtered by player class/race usability
    std::vector<VipShopItem const*> GetFilteredItems(uint8 vendorType, Player* player) const;

    // Build a colored item link string for chat
    static std::string BuildItemLink(uint32 entry, std::string const& name, uint8 quality);

    // Attempt to purchase an item; returns true on success
    bool TryPurchase(Player* player, uint32 itemEntry, uint32 price);

private:
    bool _enabled = false;

    // vendor_type -> list of items
    std::unordered_map<uint8, std::vector<VipShopItem>> _shopItems;
    // creature_entry -> vendor_type
    std::unordered_map<uint32, uint8> _npcTypeMap;
};

#define sVipShop VipShop::instance()

void AddVipShopCreatureScript();

#endif // VIP_SHOP_H
