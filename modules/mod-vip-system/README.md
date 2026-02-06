# mod-vip-system

VIP system module for AzerothCore. A stackable VIP Token item (default entry 900000) grants 24 hours of VIP status per unit. VIP time counts down in real time (online and offline) using epoch timestamps.

## Features

- Stackable VIP Token items (up to 20 per stack)
- Auto-consume: tokens are consumed automatically when received (if not already VIP) or when VIP expires
- Offline renewal: background scanner auto-consumes tokens for offline players whose VIP expired
- `.vip` command shows status, remaining time, token count, and total available time
- Fully configurable via `.conf` file

## Installation

1. Copy `mod-vip-system/` into the `modules/` directory of your AzerothCore source
2. Rebuild the server:
   ```bash
   cd build
   cmake .. && make -j$(nproc)
   ```
3. Import SQL files:
   - `data/sql/db-characters/base/mod_vip_system.sql` into your **characters** database
   - `data/sql/db-world/base/mod_vip_system_item.sql` into your **world** database
4. Copy `conf/mod_vip_system.conf.dist` to your server config directory and rename to `mod_vip_system.conf`
5. Edit configuration values as needed

## Configuration

See `conf/mod_vip_system.conf.dist` for all available options.

## Usage

- Give a player VIP tokens: `.additem 900000 <count>`
- Check VIP status: `.vip`
- Integration: use `sVipSystem->IsVip(player->GetGUID().GetCounter())` in other modules
