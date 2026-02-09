#include "VipSystem.h"

#include "Chat.h"
#include "CommandScript.h"
#include "DBCStores.h"
#include "GameTime.h"
#include "Guild.h"
#include "ObjectMgr.h"
#include "Player.h"

using namespace Acore::ChatCommands;

class VipSystemCommandScript : public CommandScript
{
public:
    VipSystemCommandScript() : CommandScript("VipSystemCommandScript") { }

    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable vipSubCommands =
        {
            { "tele",   HandleVipTeleCommand,      SEC_PLAYER, Console::No },
            { "bank",   HandleVipBankCommand,      SEC_PLAYER, Console::No },
            { "gbank",  HandleVipGuildBankCommand,  SEC_PLAYER, Console::No },
            { "mail",   HandleVipMailCommand,       SEC_PLAYER, Console::No },
            { "logout", HandleVipLogoutCommand,     SEC_PLAYER, Console::No },
            { "",       HandleVipCommand,           SEC_PLAYER, Console::No }
        };

        static ChatCommandTable commandTable =
        {
            { "vip", vipSubCommands }
        };

        return commandTable;
    }

    static bool HandleVipCommand(ChatHandler* handler)
    {
        const auto& config = sVipSystem->GetConfig();

        if (!config.Enabled)
        {
            handler->SendSysMessage("Sistema VIP desativado.");
            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        uint32 guid = player->GetGUID().GetCounter();
        bool isVip = sVipSystem->IsVip(guid);
        uint64 remaining = sVipSystem->GetRemainingSeconds(guid);
        uint32 tokenCount = player->GetItemCount(config.ItemEntry, true);
        uint64 tokenTime = static_cast<uint64>(tokenCount) * config.DurationPerItem;
        uint64 totalTime = remaining + tokenTime;

        handler->PSendSysMessage("|cff00ff00=== VIP Status ===|r");

        if (isVip)
        {
            handler->PSendSysMessage("  VIP: |cff00ff00Ativo|r");
            handler->PSendSysMessage("  Tempo restante: |cffffffff{}|r",
                VipSystem::FormatDuration(remaining));
        }
        else
        {
            handler->PSendSysMessage("  VIP: |cffff0000Inativo|r");
        }

        handler->PSendSysMessage("  xCoin Dias VIP no inventario e banco: |cffffffff{}|r", tokenCount);

        if (totalTime > 0)
        {
            handler->PSendSysMessage("  Tempo total (atual + tokens): |cffffffff{}|r",
                VipSystem::FormatDuration(totalTime));
        }
        else
        {
            handler->SendSysMessage(
                "  Voce nao possui VIP ativo e nao tem xCoin Dias VIP. Adquira para ativar.");
        }

        if (isVip)
        {
            handler->SendSysMessage("|cff00ff00=== Comandos VIP ===|r");
            if (config.EnableTeleport)
                handler->SendSysMessage("  .vip tele <nome> - Teleportar para um local");
            if (config.EnableBank)
                handler->SendSysMessage("  .vip bank - Abrir o banco");
            if (config.EnableGuildBank)
                handler->SendSysMessage("  .vip gbank - Abrir o banco da guilda");
            if (config.EnableMail)
                handler->SendSysMessage("  .vip mail - Abrir a caixa de correio");
            if (config.EnableInstantLogout)
                handler->SendSysMessage("  .vip logout - Logout instantaneo");
        }

        return true;
    }

    static bool HandleVipTeleCommand(ChatHandler* handler, GameTele const* tele)
    {
        const auto& config = sVipSystem->GetConfig();

        if (!config.Enabled)
        {
            handler->SendSysMessage("Sistema VIP desativado.");
            return true;
        }

        if (!config.EnableTeleport)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Teleporte VIP desativado.");
            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        uint32 guid = player->GetGUID().GetCounter();

        if (!sVipSystem->IsVip(guid))
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao possui VIP ativo.");
            return true;
        }

        if (!tele)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Local nao encontrado. Use: .vip tele <nome>");
            return true;
        }

        if (player->IsInCombat())
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao pode teleportar em combate.");
            return true;
        }

        if (player->InBattleground() || player->InArena())
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao pode teleportar em battleground ou arena.");
            return true;
        }

        if (!sVipSystem->CanUseTeleport(guid))
        {
            uint64 remaining = sVipSystem->GetTeleportCooldownRemaining(guid);
            handler->PSendSysMessage("|cffff0000[VIP]|r Teleporte em cooldown. Tempo restante: |cffffffff{}|r",
                VipSystem::FormatDuration(remaining));
            return true;
        }

        MapEntry const* map = sMapStore.LookupEntry(tele->mapId);
        if (!map || (map->IsBattlegroundOrArena() && player->GetMapId() != tele->mapId))
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao pode teleportar para esse local.");
            return true;
        }

        if (player->IsInFlight())
        {
            player->GetMotionMaster()->MovementExpired();
            player->CleanupAfterTaxiFlight();
        }
        else
        {
            player->SaveRecallPosition();
        }

        player->TeleportTo(tele->mapId, tele->position_x, tele->position_y, tele->position_z, tele->orientation);
        sVipSystem->SetTeleportCooldown(guid);

        handler->PSendSysMessage("|cff00ff00[VIP]|r Teleportado para: |cffffffff{}|r", tele->name);
        return true;
    }

    static bool HandleVipBankCommand(ChatHandler* handler)
    {
        const auto& config = sVipSystem->GetConfig();

        if (!config.Enabled)
        {
            handler->SendSysMessage("Sistema VIP desativado.");
            return true;
        }

        if (!config.EnableBank)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Banco VIP desativado.");
            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        uint32 guid = player->GetGUID().GetCounter();

        if (!sVipSystem->IsVip(guid))
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao possui VIP ativo.");
            return true;
        }

        player->GetSession()->SendShowBank(player->GetGUID());
        return true;
    }

    static bool HandleVipGuildBankCommand(ChatHandler* handler)
    {
        const auto& config = sVipSystem->GetConfig();

        if (!config.Enabled)
        {
            handler->SendSysMessage("Sistema VIP desativado.");
            return true;
        }

        if (!config.EnableGuildBank)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Banco da guilda VIP desativado.");
            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        uint32 guid = player->GetGUID().GetCounter();

        if (!sVipSystem->IsVip(guid))
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao possui VIP ativo.");
            return true;
        }

        Guild* guild = player->GetGuild();
        if (!guild)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao pertence a nenhuma guilda.");
            return true;
        }

        guild->SendBankTabsInfo(player->GetSession(), true);
        return true;
    }

    static bool HandleVipMailCommand(ChatHandler* handler)
    {
        const auto& config = sVipSystem->GetConfig();

        if (!config.Enabled)
        {
            handler->SendSysMessage("Sistema VIP desativado.");
            return true;
        }

        if (!config.EnableMail)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Correio VIP desativado.");
            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        uint32 guid = player->GetGUID().GetCounter();

        if (!sVipSystem->IsVip(guid))
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao possui VIP ativo.");
            return true;
        }

        player->GetSession()->SendShowMailBox(player->GetGUID());
        return true;
    }

    static bool HandleVipLogoutCommand(ChatHandler* handler)
    {
        const auto& config = sVipSystem->GetConfig();

        if (!config.Enabled)
        {
            handler->SendSysMessage("Sistema VIP desativado.");
            return true;
        }

        if (!config.EnableInstantLogout)
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Logout instantaneo VIP desativado.");
            return true;
        }

        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        uint32 guid = player->GetGUID().GetCounter();

        if (!sVipSystem->IsVip(guid))
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao possui VIP ativo.");
            return true;
        }

        if (player->IsInCombat())
        {
            handler->SendSysMessage("|cffff0000[VIP]|r Voce nao pode fazer logout em combate.");
            return true;
        }

        player->GetSession()->LogoutPlayer(true);
        return true;
    }
};

void AddVipSystemCommandScript()
{
    new VipSystemCommandScript();
}
