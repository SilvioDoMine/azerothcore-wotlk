#include "VipSystem.h"

#include "Chat.h"
#include "GameTime.h"
#include "Player.h"
#include "PlayerScript.h"

class VipSystemPlayerScript : public PlayerScript
{
public:
    VipSystemPlayerScript() : PlayerScript("VipSystemPlayerScript", {
        PLAYERHOOK_ON_LOGIN,
        PLAYERHOOK_ON_LOGOUT,
        PLAYERHOOK_ON_STORE_NEW_ITEM
    }) { }

    void OnPlayerLogin(Player* player) override
    {
        if (!sVipSystem->GetConfig().Enabled)
            return;

        uint32 guid = player->GetGUID().GetCounter();

        // Load VIP status into cache
        sVipSystem->LoadVipStatusFromDB(guid);

        // Auto-consume tokens if VIP expired
        bool isVip = sVipSystem->NormalizeVipState(player);

        // Show status message
        ChatHandler(player->GetSession()).PSendSysMessage("|cff00ff00[VIP System]|r");
        if (isVip)
        {
            uint64 remaining = sVipSystem->GetRemainingSeconds(guid);
            ChatHandler(player->GetSession()).PSendSysMessage(
                "  Status: |cff00ff00ATIVO|r - Tempo restante: |cffffffff{}|r",
                VipSystem::FormatDuration(remaining));
        }
        else
        {
            uint32 tokenCount = player->GetItemCount(sVipSystem->GetConfig().ItemEntry, true);
            if (tokenCount > 0)
            {
                ChatHandler(player->GetSession()).PSendSysMessage(
                    "  Status: |cffff0000INATIVO|r - Voce possui {} xCoin Dias VIP.",
                    tokenCount);
            }
            else
            {
                ChatHandler(player->GetSession()).SendSysMessage(
                    "  Status: |cffff0000INATIVO|r - Adquira um xCoin Dias VIP para ativar.");
            }
        }
    }

    void OnPlayerLogout(Player* player) override
    {
        if (!sVipSystem->GetConfig().Enabled)
            return;

        uint32 guid = player->GetGUID().GetCounter();
        sVipSystem->SaveVipStatusToDB(guid);
        sVipSystem->RemoveCooldowns(guid);
        sVipSystem->RemoveFromCache(guid);
    }

    void OnPlayerStoreNewItem(Player* player, Item* item, uint32 /*count*/) override
    {
        if (!sVipSystem->GetConfig().Enabled)
            return;

        if (!item || item->GetEntry() != sVipSystem->GetConfig().ItemEntry)
            return;

        sVipSystem->OnVipItemReceived(player);
    }
};

void AddVipSystemPlayerScript()
{
    new VipSystemPlayerScript();
}
