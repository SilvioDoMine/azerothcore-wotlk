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
        PLAYERHOOK_ON_STORE_NEW_ITEM,
        PLAYERHOOK_ON_UPDATE
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

    void OnPlayerUpdate(Player* player, uint32 /*p_time*/) override
    {
        if (!sVipSystem->GetConfig().Enabled || !sVipSystem->GetConfig().EnableInstantLogout)
            return;

        // If the player's session is in the 20-second logout wait, and they're VIP,
        // force instant logout by setting the logout start time to the past.
        // WorldSession::Update will then call LogoutPlayer(true) on the next tick.
        WorldSession* session = player->GetSession();
        if (session && session->isLogingOut() && !player->IsInCombat())
        {
            uint32 guid = player->GetGUID().GetCounter();
            if (sVipSystem->IsVip(guid))
                session->SetLogoutStartTime(1);
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
