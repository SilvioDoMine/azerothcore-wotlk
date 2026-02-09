#include "VipRecipeShop.h"
#include "VipShop.h"
#include "VipSystem.h"

#include "Chat.h"
#include "CreatureScript.h"
#include "DBCStores.h"
#include "GossipDef.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptedGossip.h"

enum RecipeShopSender
{
    SENDER_PROFESSION_LIST = 1,
    SENDER_RECIPE_LIST     = 2,
    SENDER_RECIPE_DETAIL   = 3
};

enum RecipeShopAction
{
    ACTION_NEXT_PAGE = 9990,
    ACTION_PREV_PAGE = 9991,
    ACTION_BUY       = 9992,
    ACTION_BACK      = 9993
};

static constexpr uint32 ITEMS_PER_PAGE = 28;
static constexpr uint32 NPC_TEXT_ID    = 200003;

struct ProfessionInfo
{
    uint32 skillId;
    const char* name;
    const char* icon;
};

static const ProfessionInfo PROFESSIONS[] =
{
    { 171, "Alchemy",         "Trade_Alchemy"                },
    { 164, "Blacksmithing",   "Trade_BlackSmithing"          },
    { 185, "Cooking",         "INV_Misc_Food_15"             },
    { 333, "Enchanting",      "Trade_Engraving"              },
    { 202, "Engineering",     "Trade_Engineering"             },
    { 129, "First Aid",       "Spell_Holy_SealOfSacrifice"   },
    { 773, "Inscription",     "INV_Inscription_Tradeskill01" },
    { 755, "Jewelcrafting",   "INV_Misc_Gem_02"              },
    { 165, "Leatherworking",  "Trade_LeatherWorking"         },
    { 197, "Tailoring",       "Trade_Tailoring"              }
};

static constexpr uint32 NUM_PROFESSIONS = sizeof(PROFESSIONS) / sizeof(PROFESSIONS[0]);

struct RecipeShopPlayerState
{
    uint32 selectedSkillId = 0;
    uint32 currentPage = 0;
    uint32 selectedItemIndex = 0;
    std::vector<VipRecipeItem const*> filteredRecipes;
};

class VipRecipeShopCreatureScript : public CreatureScript
{
public:
    VipRecipeShopCreatureScript() : CreatureScript("npc_vip_recipe_shop") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (!sVipRecipeShop->IsEnabled())
        {
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffff0000[Loja VIP]|r A loja de receitas VIP esta desativada.");
            return true;
        }

        uint32 guid = player->GetGUID().GetCounter();
        _playerStates.erase(guid);

        ShowProfessionList(player, creature);
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        ClearGossipMenuFor(player);

        uint32 guid = player->GetGUID().GetCounter();

        switch (sender)
        {
            case SENDER_PROFESSION_LIST:
                HandleProfessionSelect(player, creature, action);
                break;
            case SENDER_RECIPE_LIST:
            {
                auto it = _playerStates.find(guid);
                if (it == _playerStates.end())
                {
                    CloseGossipMenuFor(player);
                    return true;
                }
                HandleRecipeListAction(player, creature, it->second, action);
                break;
            }
            case SENDER_RECIPE_DETAIL:
            {
                auto it = _playerStates.find(guid);
                if (it == _playerStates.end())
                {
                    CloseGossipMenuFor(player);
                    return true;
                }
                HandleRecipeDetailAction(player, creature, it->second, action);
                break;
            }
            default:
                CloseGossipMenuFor(player);
                break;
        }

        return true;
    }

private:
    std::unordered_map<uint32/*guid*/, RecipeShopPlayerState> _playerStates;

    void ShowProfessionList(Player* player, Creature* creature)
    {
        ClearGossipMenuFor(player);

        bool isGM = player->IsGameMaster();
        bool hasAny = false;

        for (uint32 i = 0; i < NUM_PROFESSIONS; ++i)
        {
            uint32 skillId = PROFESSIONS[i].skillId;

            // Check if player has this profession (GM sees all)
            if (!isGM && !player->HasSkill(skillId))
                continue;

            // Check if there are recipes for this profession
            auto const& recipes = sVipRecipeShop->GetRecipesForSkill(skillId);
            if (recipes.empty())
                continue;

            std::string iconText = "|TInterface\\icons\\" + std::string(PROFESSIONS[i].icon) + ":40:40:-18|t ";
            std::string label = iconText + PROFESSIONS[i].name
                + " (" + std::to_string(recipes.size()) + " receitas)";

            AddGossipItemFor(player, GOSSIP_ICON_TRAINER, label,
                SENDER_PROFESSION_LIST, i);

            hasAny = true;
        }

        if (!hasAny)
        {
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffff0000[Loja VIP]|r Voce nao possui nenhuma profissao com receitas disponiveis.");
        }

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
    }

    void HandleProfessionSelect(Player* player, Creature* creature, uint32 action)
    {
        if (action >= NUM_PROFESSIONS)
        {
            CloseGossipMenuFor(player);
            return;
        }

        uint32 skillId = PROFESSIONS[action].skillId;
        auto const& recipes = sVipRecipeShop->GetRecipesForSkill(skillId);

        if (recipes.empty())
        {
            CloseGossipMenuFor(player);
            return;
        }

        uint32 guid = player->GetGUID().GetCounter();
        RecipeShopPlayerState state;
        state.selectedSkillId = skillId;
        state.currentPage = 0;
        state.selectedItemIndex = 0;

        // Build filtered list (pointers to the recipes)
        state.filteredRecipes.clear();
        state.filteredRecipes.reserve(recipes.size());
        for (auto const& recipe : recipes)
            state.filteredRecipes.push_back(&recipe);

        _playerStates[guid] = std::move(state);

        ShowRecipeList(player, creature);
    }

    void ShowRecipeList(Player* player, Creature* creature)
    {
        uint32 guid = player->GetGUID().GetCounter();
        auto it = _playerStates.find(guid);
        if (it == _playerStates.end())
        {
            CloseGossipMenuFor(player);
            return;
        }

        RecipeShopPlayerState& state = it->second;

        ClearGossipMenuFor(player);

        uint32 totalItems = static_cast<uint32>(state.filteredRecipes.size());
        uint32 startIndex = state.currentPage * ITEMS_PER_PAGE;
        uint32 endIndex = std::min(startIndex + ITEMS_PER_PAGE, totalItems);

        for (uint32 i = startIndex; i < endIndex; ++i)
        {
            VipRecipeItem const* recipe = state.filteredRecipes[i];

            // Build icon texture from item's display info
            std::string iconText;
            ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(recipe->itemEntry);
            if (itemTemplate)
            {
                ItemDisplayInfoEntry const* displayInfo = sItemDisplayInfoStore.LookupEntry(itemTemplate->DisplayInfoID);
                if (displayInfo && displayInfo->inventoryIcon)
                    iconText = "|TInterface\\icons\\" + std::string(displayInfo->inventoryIcon) + ":40:40:-18|t ";
            }

            std::string label = iconText
                + VipShop::BuildItemLink(recipe->itemEntry, recipe->name, recipe->quality)
                + " - " + std::to_string(recipe->price) + " dia(s)";
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, label,
                SENDER_RECIPE_LIST, i - startIndex);
        }

        // Navigation
        if (endIndex < totalItems)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Proxima Pagina >>",
                SENDER_RECIPE_LIST, ACTION_NEXT_PAGE);

        if (state.currentPage > 0)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "<< Pagina Anterior",
                SENDER_RECIPE_LIST, ACTION_PREV_PAGE);

        // Back to profession list
        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "<< Voltar",
            SENDER_RECIPE_LIST, ACTION_BACK);

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
    }

    void HandleRecipeListAction(Player* player, Creature* creature, RecipeShopPlayerState& state, uint32 action)
    {
        if (action == ACTION_NEXT_PAGE)
        {
            state.currentPage++;
            ShowRecipeList(player, creature);
            return;
        }

        if (action == ACTION_PREV_PAGE)
        {
            if (state.currentPage > 0)
                state.currentPage--;
            ShowRecipeList(player, creature);
            return;
        }

        if (action == ACTION_BACK)
        {
            // Back to profession list
            ShowProfessionList(player, creature);
            return;
        }

        // Recipe selected (action = local index within page)
        uint32 globalIndex = state.currentPage * ITEMS_PER_PAGE + action;
        if (globalIndex >= state.filteredRecipes.size())
        {
            CloseGossipMenuFor(player);
            return;
        }

        state.selectedItemIndex = globalIndex;
        VipRecipeItem const* recipe = state.filteredRecipes[globalIndex];

        // Send item link to chat
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cff00ccff[Loja VIP]|r Receita: {}",
            VipShop::BuildItemLink(recipe->itemEntry, recipe->name, recipe->quality));

        ShowRecipeDetail(player, creature, state);
    }

    void ShowRecipeDetail(Player* player, Creature* creature, RecipeShopPlayerState& state)
    {
        VipRecipeItem const* recipe = state.filteredRecipes[state.selectedItemIndex];

        ClearGossipMenuFor(player);

        std::string buyLabel = "Comprar por " + std::to_string(recipe->price) + " dia(s) VIP";

        // Build token icon + link
        std::string tokenLink;
        uint32 tokenEntry = sVipSystem->GetConfig().ItemEntry;
        ItemTemplate const* tokenTemplate = sObjectMgr->GetItemTemplate(tokenEntry);
        if (tokenTemplate)
        {
            std::string tokenIcon;
            ItemDisplayInfoEntry const* tokenDisplay = sItemDisplayInfoStore.LookupEntry(tokenTemplate->DisplayInfoID);
            if (tokenDisplay && tokenDisplay->inventoryIcon)
                tokenIcon = "|TInterface\\icons\\" + std::string(tokenDisplay->inventoryIcon) + ":20:20:-5|t ";
            tokenLink = tokenIcon + VipShop::BuildItemLink(tokenEntry, tokenTemplate->Name1, tokenTemplate->Quality);
        }

        // Build item icon for popup
        std::string iconText;
        ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(recipe->itemEntry);
        if (itemTemplate)
        {
            ItemDisplayInfoEntry const* displayInfo = sItemDisplayInfoStore.LookupEntry(itemTemplate->DisplayInfoID);
            if (displayInfo && displayInfo->inventoryIcon)
                iconText = "|TInterface\\icons\\" + std::string(displayInfo->inventoryIcon) + ":20:20:-5|t ";
        }

        std::string itemLink = VipShop::BuildItemLink(recipe->itemEntry, recipe->name, recipe->quality);
        std::string popupText = "Voce ira gastar " + std::to_string(recipe->price)
            + "x " + tokenLink + " por:\n\n" + iconText + itemLink + "\n\nDeseja continuar?";

        AddGossipItemFor(player, GOSSIP_ICON_VENDOR, buyLabel,
            SENDER_RECIPE_DETAIL, ACTION_BUY, popupText, 0, false);

        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "<< Voltar",
            SENDER_RECIPE_DETAIL, ACTION_BACK);

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
    }

    void HandleRecipeDetailAction(Player* player, Creature* creature, RecipeShopPlayerState& state, uint32 action)
    {
        if (action == ACTION_BACK)
        {
            ShowRecipeList(player, creature);
            return;
        }

        if (action == ACTION_BUY)
        {
            if (state.selectedItemIndex >= state.filteredRecipes.size())
            {
                CloseGossipMenuFor(player);
                return;
            }

            VipRecipeItem const* recipe = state.filteredRecipes[state.selectedItemIndex];
            sVipShop->TryPurchase(player, recipe->itemEntry, recipe->price);
            CloseGossipMenuFor(player);

            // Clean up state
            uint32 guid = player->GetGUID().GetCounter();
            _playerStates.erase(guid);
            return;
        }

        CloseGossipMenuFor(player);
    }
};

void AddVipRecipeShopCreatureScript()
{
    new VipRecipeShopCreatureScript();
}
