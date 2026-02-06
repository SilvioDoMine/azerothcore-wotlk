#ifndef VIP_SYSTEM_H
#define VIP_SYSTEM_H

#include <mutex>
#include <string>
#include <unordered_map>

#include "Common.h"

class Player;

struct VipSystemConfig
{
    bool Enabled = false;
    bool ConsumeOffline = true;
    uint32 ItemEntry = 18154;
    uint32 DurationPerItem = 86400;
    uint32 OfflineScanInterval = 60;
    uint32 MaxConsumptionsPerScan = 50;
    uint32 MaxConsumptionsPerLogin = 30;

    // VIP benefits
    bool EnableTeleport = true;
    bool EnableBank = true;
    bool EnableInstantLogout = true;
    uint32 TeleportCooldown = 300; // seconds
};

class VipSystem
{
public:
    static VipSystem* instance();

    void LoadConfig();
    const VipSystemConfig& GetConfig() const { return _config; }

    // Cache management (online players only)
    void LoadVipStatusFromDB(uint32 guid);
    void SaveVipStatusToDB(uint32 guid);
    void RemoveFromCache(uint32 guid);

    // Core logic
    bool NormalizeVipState(Player* player);
    void OnVipItemReceived(Player* player);
    bool IsVip(uint32 guid) const;
    uint64 GetExpiresAt(uint32 guid) const;
    uint64 GetRemainingSeconds(uint32 guid) const;

    // Teleport cooldown tracking (in-memory, resets on server restart)
    bool CanUseTeleport(uint32 guid) const;
    void SetTeleportCooldown(uint32 guid);
    uint64 GetTeleportCooldownRemaining(uint32 guid) const;
    void RemoveCooldowns(uint32 guid);

    // Offline scanner
    void RunOfflineScanner();

    // Utility
    static std::string FormatDuration(uint64 seconds);

private:
    bool ConsumeTokenAndExtend(Player* player);

    VipSystemConfig _config;
    mutable std::mutex _cacheMutex;
    std::unordered_map<uint32, uint64> _vipCache; // guid -> expires_at
    std::unordered_map<uint32, uint64> _teleportCooldowns; // guid -> next_available_timestamp
};

#define sVipSystem VipSystem::instance()

// Registered in VipSystem.cpp
void AddVipSystemScripts();

#endif // VIP_SYSTEM_H
