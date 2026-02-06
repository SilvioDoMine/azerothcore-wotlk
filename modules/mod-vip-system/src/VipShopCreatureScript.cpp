#include "VipShop.h"
#include "VipSystem.h"

#include "Chat.h"
#include "CreatureScript.h"
#include "GossipDef.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptedGossip.h"

enum VipShopSender
{
    SENDER_ITEM_LIST   = 1,
    SENDER_ITEM_DETAIL = 2,
    SENDER_CONFIRM     = 3
};

enum VipShopAction
{
    ACTION_NEXT_PAGE = 9990,
    ACTION_PREV_PAGE = 9991,
    ACTION_BUY       = 9992,
    ACTION_BACK      = 9993,
    ACTION_CONFIRM   = 9994,
    ACTION_CANCEL    = 9995
};

static constexpr uint32 ITEMS_PER_PAGE = 28;
static constexpr uint32 NPC_TEXT_ID    = 200001;

struct VipShopPlayerState
{
    uint8 vendorType = 0;
    uint32 currentPage = 0;
    uint32 selectedItemIndex = 0;
    std::vector<VipShopItem const*> filteredItems;
};

class VipShopCreatureScript : public CreatureScript
{
public:
    VipShopCreatureScript() : CreatureScript("npc_vip_shop") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (!sVipShop->IsEnabled())
        {
            ChatHandler(player->GetSession()).PSendSysMessage("|cffff0000[Loja VIP]|r A loja VIP esta desativada.");
            return true;
        }

        uint8 vendorType = sVipShop->GetVendorType(creature->GetEntry());
        if (vendorType == 0)
            return true;

        uint32 guid = player->GetGUID().GetCounter();

        // Build state for this player
        VipShopPlayerState state;
        state.vendorType = vendorType;
        state.currentPage = 0;
        state.selectedItemIndex = 0;
        state.filteredItems = sVipShop->GetFilteredItems(vendorType, player);

        _playerStates[guid] = std::move(state);

        if (_playerStates[guid].filteredItems.empty())
        {
            ClearGossipMenuFor(player);
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffff0000[Loja VIP]|r Nenhum item disponivel para sua classe.");
            SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
            return true;
        }

        ShowItemList(player, creature);
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
    {
        ClearGossipMenuFor(player);

        uint32 guid = player->GetGUID().GetCounter();
        auto it = _playerStates.find(guid);
        if (it == _playerStates.end())
        {
            CloseGossipMenuFor(player);
            return true;
        }

        VipShopPlayerState& state = it->second;

        switch (sender)
        {
            case SENDER_ITEM_LIST:
                HandleItemListAction(player, creature, state, action);
                break;
            case SENDER_ITEM_DETAIL:
                HandleItemDetailAction(player, creature, state, action);
                break;
            case SENDER_CONFIRM:
                HandleConfirmAction(player, creature, state, action);
                break;
            default:
                CloseGossipMenuFor(player);
                break;
        }

        return true;
    }

private:
    std::unordered_map<uint32/*guid*/, VipShopPlayerState> _playerStates;

    void ShowItemList(Player* player, Creature* creature)
    {
        uint32 guid = player->GetGUID().GetCounter();
        VipShopPlayerState& state = _playerStates[guid];

        ClearGossipMenuFor(player);

        uint32 totalItems = static_cast<uint32>(state.filteredItems.size());
        uint32 startIndex = state.currentPage * ITEMS_PER_PAGE;
        uint32 endIndex = std::min(startIndex + ITEMS_PER_PAGE, totalItems);

        for (uint32 i = startIndex; i < endIndex; ++i)
        {
            VipShopItem const* item = state.filteredItems[i];
            std::string label = VipShop::BuildItemLink(item->itemEntry, item->name, item->quality)
                + " - " + std::to_string(item->price) + " dia(s)";
            // Debug: log label to server log and also send to player chat for verification
            LOG_INFO("module", "mod-vip-system: gossip label='{}'", label);
            ChatHandler(player->GetSession()).PSendSysMessage("[Loja VIP] Opcao: {}", label);
            AddGossipItemFor(player, GOSSIP_ICON_VENDOR, label,
                SENDER_ITEM_LIST, i - startIndex);
        }

        // Navigation
        if (endIndex < totalItems)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Proxima Pagina >>",
                SENDER_ITEM_LIST, ACTION_NEXT_PAGE);

        if (state.currentPage > 0)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "<< Pagina Anterior",
                SENDER_ITEM_LIST, ACTION_PREV_PAGE);

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
    }

    void HandleItemListAction(Player* player, Creature* creature, VipShopPlayerState& state, uint32 action)
    {
        if (action == ACTION_NEXT_PAGE)
        {
            state.currentPage++;
            ShowItemList(player, creature);
            return;
        }

        if (action == ACTION_PREV_PAGE)
        {
            if (state.currentPage > 0)
                state.currentPage--;
            ShowItemList(player, creature);
            return;
        }

        // Item selected (action = local index within page)
        uint32 globalIndex = state.currentPage * ITEMS_PER_PAGE + action;
        if (globalIndex >= state.filteredItems.size())
        {
            CloseGossipMenuFor(player);
            return;
        }

        state.selectedItemIndex = globalIndex;
        VipShopItem const* item = state.filteredItems[globalIndex];

        // Send item link to chat
        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cff00ccff[Loja VIP]|r Item: {}",
            VipShop::BuildItemLink(item->itemEntry, item->name, item->quality));

        ShowItemDetail(player, creature, state);
    }

    void ShowItemDetail(Player* player, Creature* creature, VipShopPlayerState& state)
    {
        VipShopItem const* item = state.filteredItems[state.selectedItemIndex];

        ClearGossipMenuFor(player);

        std::string buyLabel = "Comprar por " + std::to_string(item->price) + " dia(s) VIP";
        AddGossipItemFor(player, GOSSIP_ICON_VENDOR, buyLabel,
            SENDER_ITEM_DETAIL, ACTION_BUY);

        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "<< Voltar",
            SENDER_ITEM_DETAIL, ACTION_BACK);

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
    }

    void HandleItemDetailAction(Player* player, Creature* creature, VipShopPlayerState& state, uint32 action)
    {
        if (action == ACTION_BACK)
        {
            ShowItemList(player, creature);
            return;
        }

        if (action == ACTION_BUY)
        {
            ShowConfirmation(player, creature, state);
            return;
        }

        CloseGossipMenuFor(player);
    }

    void ShowConfirmation(Player* player, Creature* creature, VipShopPlayerState& state)
    {
        VipShopItem const* item = state.filteredItems[state.selectedItemIndex];
        uint32 tokenEntry = sVipSystem->GetConfig().ItemEntry;
        uint32 tokenCount = player->GetItemCount(tokenEntry, false);

        ClearGossipMenuFor(player);

        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cffffcc00[Loja VIP]|r Confirmar: Gastar {} dia(s) VIP por {}? (Voce tem {} tokens)",
            item->price,
            VipShop::BuildItemLink(item->itemEntry, item->name, item->quality),
            tokenCount);

        AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "Confirmar Compra",
            SENDER_CONFIRM, ACTION_CONFIRM);

        AddGossipItemFor(player, GOSSIP_ICON_CHAT, "Cancelar",
            SENDER_CONFIRM, ACTION_CANCEL);

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
    }

    void HandleConfirmAction(Player* player, Creature* creature, VipShopPlayerState& state, uint32 action)
    {
        if (action == ACTION_CANCEL)
        {
            ShowItemList(player, creature);
            return;
        }

        if (action == ACTION_CONFIRM)
        {
            if (state.selectedItemIndex >= state.filteredItems.size())
            {
                CloseGossipMenuFor(player);
                return;
            }

            VipShopItem const* item = state.filteredItems[state.selectedItemIndex];
            sVipShop->TryPurchase(player, item->itemEntry, item->price);
            CloseGossipMenuFor(player);

            // Clean up state
            uint32 guid = player->GetGUID().GetCounter();
            _playerStates.erase(guid);
            return;
        }

        CloseGossipMenuFor(player);
    }
};

void AddVipShopCreatureScript()
{
    new VipShopCreatureScript();
}
