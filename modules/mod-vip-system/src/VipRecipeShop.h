#ifndef VIP_RECIPE_SHOP_H
#define VIP_RECIPE_SHOP_H

#include <string>
#include <unordered_map>
#include <vector>

#include "Common.h"

struct VipRecipeItem
{
    uint32 itemEntry;
    uint32 price; // in VIP tokens (days)
    std::string name;
    uint8 quality;
    uint32 requiredSkillRank;
};

class VipRecipeShop
{
public:
    static VipRecipeShop* instance();

    void LoadConfig();
    void LoadFromDB();

    bool IsEnabled() const { return _enabled; }

    // Get recipes for a given profession skill ID
    std::vector<VipRecipeItem> const& GetRecipesForSkill(uint32 skillId) const;

    // Get all skill IDs that have recipes loaded
    std::vector<uint32> GetAvailableSkillIds() const;

private:
    bool _enabled = false;

    // skillId -> list of recipes (sorted by requiredSkillRank DESC)
    std::unordered_map<uint32, std::vector<VipRecipeItem>> _recipesBySkill;

    // empty vector for returning ref when skill not found
    static const std::vector<VipRecipeItem> _emptyVec;
};

#define sVipRecipeShop VipRecipeShop::instance()

void AddVipRecipeShopCreatureScript();

#endif // VIP_RECIPE_SHOP_H
