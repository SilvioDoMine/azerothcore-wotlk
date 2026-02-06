#include "VipSystem.h"

#include "Chat.h"
#include "CommandScript.h"
#include "GameTime.h"
#include "Player.h"

using namespace Acore::ChatCommands;

class VipSystemCommandScript : public CommandScript
{
public:
    VipSystemCommandScript() : CommandScript("VipSystemCommandScript") { }

    ChatCommandTable GetCommands() const override
    {
        static ChatCommandTable commandTable =
        {
            { "vip", HandleVipCommand, SEC_PLAYER, Console::No }
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
        uint32 tokenCount = player->GetItemCount(config.ItemEntry, false);
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

        handler->PSendSysMessage("  xCoin Dias VIP no inventario: |cffffffff{}|r", tokenCount);

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

        return true;
    }
};

void AddVipSystemCommandScript()
{
    new VipSystemCommandScript();
}
