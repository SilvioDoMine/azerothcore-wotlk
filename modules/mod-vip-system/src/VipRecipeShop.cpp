#include "VipRecipeShop.h"

#include <algorithm>

#include "Config.h"
#include "DatabaseEnv.h"
#include "Field.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "QueryResult.h"

const std::vector<VipRecipeItem> VipRecipeShop::_emptyVec = {};

VipRecipeShop* VipRecipeShop::instance()
{
    static VipRecipeShop inst;
    return &inst;
}

void VipRecipeShop::LoadConfig()
{
    _enabled = sConfigMgr->GetOption<bool>("VipSystem.RecipeShopEnable", true);
}

void VipRecipeShop::LoadFromDB()
{
    if (!_enabled)
    {
        LOG_INFO("module", "mod-vip-system: VipRecipeShop disabled by config");
        return;
    }

    _recipesBySkill.clear();

    // Query all recipe items (class=9) that require skill rank >= 300
    QueryResult result = WorldDatabase.Query(
        "SELECT entry, name, Quality, RequiredSkill, RequiredSkillRank "
        "FROM item_template WHERE class = 9 AND RequiredSkillRank >= 300");

    if (!result)
    {
        LOG_INFO("module", "mod-vip-system: VipRecipeShop loaded 0 recipes");
        return;
    }

    uint32 totalRecipes = 0;
    do
    {
        Field* fields = result->Fetch();
        uint32 entry           = fields[0].Get<uint32>();
        std::string name       = fields[1].Get<std::string>();
        uint8 quality          = fields[2].Get<uint8>();
        uint32 requiredSkill   = fields[3].Get<uint32>();
        uint32 requiredRank    = fields[4].Get<uint32>();

        // Verify item exists in ObjectMgr
        ItemTemplate const* proto = sObjectMgr->GetItemTemplate(entry);
        if (!proto)
            continue;

        // Calculate price based on skill rank
        uint32 price;
        if (requiredRank >= 425)
            price = 3;
        else if (requiredRank >= 375)
            price = 2;
        else
            price = 1;

        VipRecipeItem item;
        item.itemEntry = entry;
        item.price = price;
        item.name = name;
        item.quality = quality;
        item.requiredSkillRank = requiredRank;

        _recipesBySkill[requiredSkill].push_back(item);
        totalRecipes++;
    } while (result->NextRow());

    // Sort each skill's recipes by requiredSkillRank descending (highest first)
    for (auto& [skillId, recipes] : _recipesBySkill)
    {
        std::sort(recipes.begin(), recipes.end(),
            [](VipRecipeItem const& a, VipRecipeItem const& b)
            {
                return a.requiredSkillRank > b.requiredSkillRank;
            });
    }

    LOG_INFO("module", "mod-vip-system: VipRecipeShop loaded {} recipes across {} professions",
        totalRecipes, _recipesBySkill.size());
}

std::vector<VipRecipeItem> const& VipRecipeShop::GetRecipesForSkill(uint32 skillId) const
{
    auto it = _recipesBySkill.find(skillId);
    if (it != _recipesBySkill.end())
        return it->second;
    return _emptyVec;
}

std::vector<uint32> VipRecipeShop::GetAvailableSkillIds() const
{
    std::vector<uint32> result;
    result.reserve(_recipesBySkill.size());
    for (auto const& [skillId, _] : _recipesBySkill)
        result.push_back(skillId);
    return result;
}
