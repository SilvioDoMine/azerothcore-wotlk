#include "VipSystem.h"

#include "Chat.h"
#include "CommandScript.h"
#include "Config.h"
#include "DatabaseEnv.h"
#include "GameTime.h"
#include "Log.h"
#include "Player.h"
#include "PlayerScript.h"
#include "WorldScript.h"

VipSystem* VipSystem::instance()
{
    static VipSystem inst;
    return &inst;
}

void VipSystem::LoadConfig()
{
    _config.Enabled              = sConfigMgr->GetOption<bool>("VipSystem.Enable", true);
    _config.ConsumeOffline       = sConfigMgr->GetOption<bool>("VipSystem.ConsumeOffline", true);
    _config.ItemEntry            = sConfigMgr->GetOption<uint32>("VipSystem.ItemEntry", 18154);
    _config.DurationPerItem      = sConfigMgr->GetOption<uint32>("VipSystem.DurationPerItem", 86400);
    _config.OfflineScanInterval  = sConfigMgr->GetOption<uint32>("VipSystem.OfflineScanIntervalSec", 60);
    _config.MaxConsumptionsPerScan  = sConfigMgr->GetOption<uint32>("VipSystem.MaxConsumptionsPerScan", 50);
    _config.MaxConsumptionsPerLogin = sConfigMgr->GetOption<uint32>("VipSystem.MaxConsumptionsPerLogin", 30);

    _config.EnableTeleport       = sConfigMgr->GetOption<bool>("VipSystem.EnableTeleport", true);
    _config.EnableBank           = sConfigMgr->GetOption<bool>("VipSystem.EnableBank", true);
    _config.EnableInstantLogout  = sConfigMgr->GetOption<bool>("VipSystem.EnableInstantLogout", true);
    _config.TeleportCooldown     = sConfigMgr->GetOption<uint32>("VipSystem.TeleportCooldown", 300);

    LOG_INFO("module", "mod-vip-system: {} (ItemEntry={}, Duration={}s, OfflineScan={})",
        _config.Enabled ? "Enabled" : "Disabled",
        _config.ItemEntry, _config.DurationPerItem, _config.ConsumeOffline ? "On" : "Off");
}

// ============================================================
// Cache management
// ============================================================

void VipSystem::LoadVipStatusFromDB(uint32 guid)
{
    QueryResult result = CharacterDatabase.Query(
        "SELECT `expires_at` FROM `character_vip_status` WHERE `guid` = {}",
        guid);

    std::lock_guard<std::mutex> lock(_cacheMutex);
    if (result)
    {
        _vipCache[guid] = result->Fetch()[0].Get<uint64>();
    }
    else
    {
        _vipCache[guid] = 0;
    }
}

void VipSystem::SaveVipStatusToDB(uint32 guid)
{
    uint64 expiresAt = 0;
    {
        std::lock_guard<std::mutex> lock(_cacheMutex);
        auto it = _vipCache.find(guid);
        if (it != _vipCache.end())
            expiresAt = it->second;
    }

    if (expiresAt > 0)
    {
        CharacterDatabase.DirectExecute(
            "REPLACE INTO `character_vip_status` (`guid`, `expires_at`) VALUES ({}, {})",
            guid, expiresAt);
    }
}

void VipSystem::RemoveFromCache(uint32 guid)
{
    std::lock_guard<std::mutex> lock(_cacheMutex);
    _vipCache.erase(guid);
}

// ============================================================
// Core logic
// ============================================================

bool VipSystem::IsVip(uint32 guid) const
{
    std::lock_guard<std::mutex> lock(_cacheMutex);
    auto it = _vipCache.find(guid);
    if (it == _vipCache.end())
        return false;
    return it->second > static_cast<uint64>(GameTime::GetGameTime().count());
}

uint64 VipSystem::GetExpiresAt(uint32 guid) const
{
    std::lock_guard<std::mutex> lock(_cacheMutex);
    auto it = _vipCache.find(guid);
    if (it == _vipCache.end())
        return 0;
    return it->second;
}

uint64 VipSystem::GetRemainingSeconds(uint32 guid) const
{
    uint64 now = static_cast<uint64>(GameTime::GetGameTime().count());
    uint64 expiresAt = GetExpiresAt(guid);
    if (expiresAt > now)
        return expiresAt - now;
    return 0;
}

bool VipSystem::ConsumeTokenAndExtend(Player* player)
{
    uint32 itemEntry = _config.ItemEntry;

    if (!player->HasItemCount(itemEntry, 1, true))
        return false;

    player->DestroyItemCount(itemEntry, 1, true);

    uint32 guid = player->GetGUID().GetCounter();
    uint64 now = static_cast<uint64>(GameTime::GetGameTime().count());
    uint64 expiresAt = 0;
    {
        std::lock_guard<std::mutex> lock(_cacheMutex);
        auto it = _vipCache.find(guid);
        if (it != _vipCache.end())
            expiresAt = it->second;
    }

    // Stack on existing if still valid, else start from now
    uint64 base = (expiresAt > now) ? expiresAt : now;
    uint64 newExpiry = base + _config.DurationPerItem;

    {
        std::lock_guard<std::mutex> lock(_cacheMutex);
        _vipCache[guid] = newExpiry;
    }

    CharacterDatabase.DirectExecute(
        "REPLACE INTO `character_vip_status` (`guid`, `expires_at`) VALUES ({}, {})",
        guid, newExpiry);

    // Notify player about VIP renewal
    ChatHandler(player->GetSession()).PSendSysMessage(
        "|cff00ff00[VIP System]|r Seu VIP foi renovado! Tempo restante: |cffffffff{}|r",
        FormatDuration(newExpiry - now));

    return true;
}

bool VipSystem::NormalizeVipState(Player* player)
{
    uint32 guid = player->GetGUID().GetCounter();
    uint64 now = static_cast<uint64>(GameTime::GetGameTime().count());

    // Check if already VIP
    {
        std::lock_guard<std::mutex> lock(_cacheMutex);
        auto it = _vipCache.find(guid);
        if (it != _vipCache.end() && it->second > now)
            return true; // Still VIP
    }

    // VIP expired or never had it - try consuming tokens
    uint32 consumed = 0;
    while (consumed < _config.MaxConsumptionsPerLogin)
    {
        if (!ConsumeTokenAndExtend(player))
            break;

        consumed++;

        // Check if now VIP
        if (IsVip(guid))
            break;
    }

    if (consumed > 0)
    {
        LOG_DEBUG("module", "mod-vip-system: Player {} consumed {} VIP token(s) on login/normalize",
            guid, consumed);
    }

    return IsVip(guid);
}

void VipSystem::OnVipItemReceived(Player* player)
{
    if (!_config.Enabled)
        return;

    uint32 guid = player->GetGUID().GetCounter();

    // If player is already VIP, do nothing (token stays in inventory)
    if (IsVip(guid))
        return;

    // Auto-consume to activate VIP
    NormalizeVipState(player);
}

// ============================================================
// Teleport cooldown tracking
// ============================================================

bool VipSystem::CanUseTeleport(uint32 guid) const
{
    std::lock_guard<std::mutex> lock(_cacheMutex);
    auto it = _teleportCooldowns.find(guid);
    if (it == _teleportCooldowns.end())
        return true;
    return static_cast<uint64>(GameTime::GetGameTime().count()) >= it->second;
}

void VipSystem::SetTeleportCooldown(uint32 guid)
{
    uint64 nextAvailable = static_cast<uint64>(GameTime::GetGameTime().count()) + _config.TeleportCooldown;
    std::lock_guard<std::mutex> lock(_cacheMutex);
    _teleportCooldowns[guid] = nextAvailable;
}

uint64 VipSystem::GetTeleportCooldownRemaining(uint32 guid) const
{
    std::lock_guard<std::mutex> lock(_cacheMutex);
    auto it = _teleportCooldowns.find(guid);
    if (it == _teleportCooldowns.end())
        return 0;
    uint64 now = static_cast<uint64>(GameTime::GetGameTime().count());
    if (it->second > now)
        return it->second - now;
    return 0;
}

void VipSystem::RemoveCooldowns(uint32 guid)
{
    std::lock_guard<std::mutex> lock(_cacheMutex);
    _teleportCooldowns.erase(guid);
}

// ============================================================
// Offline scanner
// ============================================================

void VipSystem::RunOfflineScanner()
{
    if (!_config.Enabled || !_config.ConsumeOffline)
        return;

    uint64 now = static_cast<uint64>(GameTime::GetGameTime().count());

    QueryResult result = CharacterDatabase.Query(
        "SELECT v.guid, ii.guid AS item_guid, ii.count "
        "FROM character_vip_status v "
        "JOIN characters c ON c.guid = v.guid AND c.online = 0 "
        "JOIN character_inventory ci ON ci.guid = v.guid "
        "JOIN item_instance ii ON ii.guid = ci.item AND ii.itemEntry = {} "
        "WHERE v.expires_at > 0 AND v.expires_at <= {} "
        "ORDER BY v.guid "
        "LIMIT {}",
        _config.ItemEntry, now, _config.MaxConsumptionsPerScan);

    if (!result)
        return;

    uint32 processed = 0;
    do
    {
        Field* fields = result->Fetch();
        uint32 playerGuid = fields[0].Get<uint32>();
        uint32 itemGuid   = fields[1].Get<uint32>();
        uint32 itemCount  = fields[2].Get<uint32>();

        // Begin a transaction for each player
        auto trans = CharacterDatabase.BeginTransaction();

        if (itemCount > 1)
        {
            trans->Append("UPDATE item_instance SET count = count - 1 WHERE guid = {}", itemGuid);
        }
        else
        {
            trans->Append("DELETE FROM character_inventory WHERE item = {}", itemGuid);
            trans->Append("DELETE FROM item_instance WHERE guid = {}", itemGuid);
        }

        uint64 newExpiry = now + _config.DurationPerItem;
        trans->Append(
            "REPLACE INTO character_vip_status (guid, expires_at) VALUES ({}, {})",
            playerGuid, newExpiry);

        CharacterDatabase.CommitTransaction(trans);
        processed++;

    } while (result->NextRow());

    if (processed > 0)
    {
        LOG_DEBUG("module", "mod-vip-system: Offline scanner processed {} expired VIP(s)", processed);
    }
}

// ============================================================
// Utility
// ============================================================

std::string VipSystem::FormatDuration(uint64 seconds)
{
    if (seconds == 0)
        return "0s";

    uint64 days    = seconds / 86400;
    uint64 hours   = (seconds % 86400) / 3600;
    uint64 minutes = (seconds % 3600) / 60;
    uint64 secs    = seconds % 60;

    std::string result;
    if (days > 0)
        result += std::to_string(days) + "d ";
    if (hours > 0)
        result += std::to_string(hours) + "h ";
    if (minutes > 0)
        result += std::to_string(minutes) + "m ";
    if (secs > 0 || result.empty())
        result += std::to_string(secs) + "s";

    // Trim trailing space
    if (!result.empty() && result.back() == ' ')
        result.pop_back();

    return result;
}
