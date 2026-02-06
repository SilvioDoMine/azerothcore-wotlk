#include "VipSystem.h"
#include "VipShop.h"

#include "WorldScript.h"

class VipSystemWorldScript : public WorldScript
{
public:
    VipSystemWorldScript() : WorldScript("VipSystemWorldScript", {
        WORLDHOOK_ON_AFTER_CONFIG_LOAD,
        WORLDHOOK_ON_STARTUP,
        WORLDHOOK_ON_UPDATE
    }) { }

    void OnAfterConfigLoad(bool reload) override
    {
        sVipSystem->LoadConfig();
        sVipShop->LoadConfig();

        // On reload, item_template is already loaded, safe to reload shop
        if (reload)
            sVipShop->LoadFromDB();
    }

    void OnStartup() override
    {
        // item_template is fully loaded at this point
        sVipShop->LoadFromDB();
    }

    void OnUpdate(uint32 diff) override
    {
        const auto& config = sVipSystem->GetConfig();
        if (!config.Enabled || !config.ConsumeOffline)
            return;

        _scanTimer += diff;

        uint32 intervalMs = config.OfflineScanInterval * 1000;
        if (_scanTimer >= intervalMs)
        {
            _scanTimer -= intervalMs;
            sVipSystem->RunOfflineScanner();
        }
    }

private:
    uint32 _scanTimer = 0;
};

void AddVipSystemWorldScript()
{
    new VipSystemWorldScript();
}
