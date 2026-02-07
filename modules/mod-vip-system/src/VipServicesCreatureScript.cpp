#include "VipShop.h"
#include "VipSystem.h"

#include "Chat.h"
#include "CreatureScript.h"
#include "DBCStores.h"
#include "GossipDef.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptedGossip.h"

enum VipServiceSender
{
    SENDER_SERVICE_LIST    = 1,
    SENDER_SERVICE_CONFIRM = 2
};

enum VipServiceAction
{
    ACTION_RENAME         = 0,
    ACTION_CUSTOMIZE      = 1,
    ACTION_CHANGE_RACE    = 2,
    ACTION_CHANGE_FACTION = 3
};

static constexpr uint32 NPC_TEXT_ID = 200002;

struct VipServiceInfo
{
    uint32 action;
    AtLoginFlags flag;
    const char* name;
    const char* description;
};

static const VipServiceInfo SERVICES[] =
{
    { ACTION_RENAME,         AT_LOGIN_RENAME,         "Troca de Nome",               "trocar o nome do seu personagem" },
    { ACTION_CUSTOMIZE,      AT_LOGIN_CUSTOMIZE,      "Trocar Aparencia",             "trocar a aparencia do seu personagem" },
    { ACTION_CHANGE_RACE,    AT_LOGIN_CHANGE_RACE,    "Troca de Raca",               "trocar a raca do seu personagem (mesma faccao)" },
    { ACTION_CHANGE_FACTION, AT_LOGIN_CHANGE_FACTION,  "Troca de Faccao",            "trocar a faccao do seu personagem" }
};

class VipServicesCreatureScript : public CreatureScript
{
public:
    VipServicesCreatureScript() : CreatureScript("npc_vip_services") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        auto const& config = sVipSystem->GetConfig();

        if (!config.Enabled || !config.EnableServices)
        {
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffff0000[Servicos VIP]|r Os servicos VIP estao desativados.");
            return true;
        }

        ClearGossipMenuFor(player);

        // Build token icon string
        std::string tokenIcon;
        ItemTemplate const* tokenTemplate = sObjectMgr->GetItemTemplate(config.ItemEntry);
        if (tokenTemplate)
        {
            ItemDisplayInfoEntry const* tokenDisplay = sItemDisplayInfoStore.LookupEntry(tokenTemplate->DisplayInfoID);
            if (tokenDisplay && tokenDisplay->inventoryIcon)
                tokenIcon = "|TInterface\\icons\\" + std::string(tokenDisplay->inventoryIcon) + ":40:40:-18|t ";
        }

        // Build token link for popups (icon + clickable item link)
        std::string tokenLink;
        if (tokenTemplate)
        {
            std::string smallIcon;
            ItemDisplayInfoEntry const* tokenDisplay = sItemDisplayInfoStore.LookupEntry(tokenTemplate->DisplayInfoID);
            if (tokenDisplay && tokenDisplay->inventoryIcon)
                smallIcon = "|TInterface\\icons\\" + std::string(tokenDisplay->inventoryIcon) + ":20:20|t";

            tokenLink = smallIcon + VipShop::BuildItemLink(config.ItemEntry, tokenTemplate->Name1, tokenTemplate->Quality);
        }

        bool hasAnyService = false;

        for (auto const& svc : SERVICES)
        {
            if (player->HasAtLoginFlag(svc.flag))
                continue;

            uint32 price = GetServicePrice(svc.action, config);
            std::string label = tokenIcon + svc.name + " - " + std::to_string(price) + " dia(s)";

            std::string popupText = "Voce ira gastar " + std::to_string(price)
                + "x " + tokenLink + " por " + svc.name
                + ".\n\nNa proxima vez que deslogar e logar, a opcao estara disponivel.\n\nDeseja continuar?";

            AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, label,
                SENDER_SERVICE_CONFIRM, svc.action, popupText, 0, false);

            hasAnyService = true;
        }

        if (!hasAnyService)
        {
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffffff00[Servicos VIP]|r Todos os servicos ja estao pendentes. Deslogue e logue para usa-los.");
        }

        SendGossipMenuFor(player, NPC_TEXT_ID, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 sender, uint32 action) override
    {
        ClearGossipMenuFor(player);
        CloseGossipMenuFor(player);

        if (sender != SENDER_SERVICE_CONFIRM)
            return true;

        auto const& config = sVipSystem->GetConfig();

        if (!config.Enabled || !config.EnableServices)
            return true;

        // Find the service
        VipServiceInfo const* service = nullptr;
        for (auto const& svc : SERVICES)
        {
            if (svc.action == action)
            {
                service = &svc;
                break;
            }
        }

        if (!service)
            return true;

        // Check if flag is already set (shouldn't happen since we filter in menu, but double-check)
        if (player->HasAtLoginFlag(service->flag))
        {
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffffff00[Servicos VIP]|r Este servico ja esta pendente.");
            return true;
        }

        uint32 price = GetServicePrice(action, config);

        // Check if player has enough tokens
        if (!player->HasItemCount(config.ItemEntry, price, true))
        {
            ChatHandler(player->GetSession()).PSendSysMessage(
                "|cffff0000[Servicos VIP]|r Voce nao tem tokens suficientes. Necessario: {} dia(s) VIP.", price);
            return true;
        }

        // Consume tokens
        player->DestroyItemCount(config.ItemEntry, price, true);

        // Set the at-login flag
        player->SetAtLoginFlag(service->flag);

        // Save to DB immediately
        CharacterDatabase.DirectExecute(
            "UPDATE characters SET at_login = at_login | {} WHERE guid = {}",
            static_cast<uint32>(service->flag), player->GetGUID().GetCounter());

        ChatHandler(player->GetSession()).PSendSysMessage(
            "|cff00ff00[Servicos VIP]|r {} adquirido(a) com sucesso! Deslogue e logue novamente para utilizar o servico.",
            service->name);

        LOG_INFO("module", "mod-vip-system: Player {} (GUID: {}) purchased service '{}' for {} token(s)",
            player->GetName(), player->GetGUID().GetCounter(), service->name, price);

        return true;
    }

private:
    static uint32 GetServicePrice(uint32 action, VipSystemConfig const& config)
    {
        switch (action)
        {
            case ACTION_RENAME:         return config.ServicePriceRename;
            case ACTION_CUSTOMIZE:      return config.ServicePriceCustomize;
            case ACTION_CHANGE_RACE:    return config.ServicePriceChangeRace;
            case ACTION_CHANGE_FACTION: return config.ServicePriceChangeFaction;
            default: return 0;
        }
    }
};

void AddVipServicesCreatureScript()
{
    new VipServicesCreatureScript();
}
