#include "VipSystem.h"

#include "WorldScript.h"

class VipSystemWorldScript : public WorldScript
{
public:
    VipSystemWorldScript() : WorldScript("VipSystemWorldScript", {
        WORLDHOOK_ON_AFTER_CONFIG_LOAD,
        WORLDHOOK_ON_UPDATE
    }) { }

    void OnAfterConfigLoad(bool /*reload*/) override
    {
        sVipSystem->LoadConfig();
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
