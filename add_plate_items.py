#!/usr/bin/env python3
"""
Adds Plate items to the slot-based MD files under 'Itens de corpo'.
Parses data from user-provided tables, deduplicates, validates against DB, and writes.
"""

import subprocess
import os

DB_HOST = "69.62.88.216"
DB_PORT = "3306"
DB_USER = "silvio"
DB_PASS = "zenha123"
DB_NAME = "acore_world"

BASE_DIR = '/Users/arthurhenrique/work/azerothcore-wotlk/Itens_VIP_Markdown/Itens de corpo'

INVENTORY_TYPE_MAP = {
    1: 'Head', 3: 'Shoulder', 5: 'Chest', 6: 'Waist',
    7: 'Legs', 8: 'Feet', 9: 'Wrist', 10: 'Hands',
    20: 'Chest',  # Robe = Chest
}

# ========== PRIMARY TABLE DATA (organized by slot) ==========
# These take priority for pricing

primary_items = {
    'Feet': [
        (53125, "Apocalypse's Advance", 235, "Normal"),
        (54578, "Apocalypse's Advance", 246, "Heroic"),
        (49983, "Blood-Soaked Saronite Stompers", 12, "Normal"),
        (50639, "Blood-Soaked Saronite Stompers", 13, "Heroic"),
        (50190, "Grinning Skull Greatboots", 11, "Normal"),
        (50625, "Grinning Skull Greatboots", 12, "Heroic"),
        (53129, "Treads of Impending Resurrection", 6, "Normal"),
        (54579, "Treads of Impending Resurrection", 6, "Heroic"),
    ],
    'Head': [
        (49986, "Broken Ram Skull Helm", 16, "Normal"),
        (50640, "Broken Ram Skull Helm", 17, "Heroic"),
        (51724, "Lightsworn Headpiece", 17, "Normal"),
        (51167, "Sanctified Lightsworn Headpiece", 23, "Normal"),
        (51272, "Sanctified Lightsworn Headpiece", 24, "Heroic"),
        (51162, "Sanctified Lightsworn Helmet", 19, "Normal"),
        (51277, "Sanctified Lightsworn Helmet", 20, "Heroic"),
        (51684, "Scourgelord Helmet", 18, "Normal"),
        (51543, "Wrathful Gladiator's Plate Helm", 28, "Normal"),
        (51476, "Wrathful Gladiator's Scaled Helm", 43, "Normal"),
        (51769, "Ymirjar Lord's Helmet", 23, "Normal"),
    ],
    'Shoulder': [
        (51721, "Lightsworn Shoulderplates", 10, "Normal"),
        (51160, "Sanctified Lightsworn Shoulderplates", 11, "Normal"),
        (51279, "Sanctified Lightsworn Shoulderplates", 12, "Heroic"),
        (51210, "Sanctified Ymirjar Lord's Shoulderplates", 24, "Normal"),
        (51229, "Sanctified Ymirjar Lord's Shoulderplates", 25, "Heroic"),
        (50098, "Scourgelord Shoulderplates", 10, "Normal"),
        (51418, "Wrathful Gladiator's Dreadplate Shoulders", 88, "Normal"),
        (51473, "Wrathful Gladiator's Ornamented Spaulders", 31, "Normal"),
        (51545, "Wrathful Gladiator's Plate Shoulders", 60, "Normal"),
        (51479, "Wrathful Gladiator's Scaled Shoulders", 84, "Normal"),
    ],
    'Chest': [
        (51717, "Lightsworn Battleplate", 18, "Normal"),
        (50027, "Rot-Resistant Breastplate", 9, "Normal"),
        (50680, "Rot-Resistant Breastplate", 10, "Heroic"),
        (51134, "Sanctified Scourgelord Chestguard", 10, "Normal"),
        (51305, "Sanctified Scourgelord Chestguard", 11, "Heroic"),
        (50094, "Scourgelord Battleplate", 17, "Normal"),
        (51771, "Ymirjar Lord's Battleplate", 23, "Normal"),
    ],
    'Waist': [
        (47268, "Bloodbath Girdle", 6, "Normal"),
        (47429, "Bloodbath Girdle", 6, "Heroic"),
        (50187, "Coldwraith Links", 22, "Normal"),
        (50620, "Coldwraith Links", 23, "Heroic"),
        (51782, "Etched Dragonbone Girdle", 15, "Normal"),
        (51821, "Etched Dragonbone Girdle", 16, "Heroic"),
        (51000, "Flesh-Shaper's Gurney Strap", 28, "Normal"),
        (51879, "Flesh-Shaper's Gurney Strap", 29, "Heroic"),
        (51362, "Wrathful Gladiator's Girdle of Triumph", 39, "Normal"),
    ],
    'Legs': [
        (50325, "Lightsworn Legplates", 14, "Normal"),
        (51211, "Sanctified Ymirjar Lord's Legplates", 14, "Normal"),
        (51228, "Sanctified Ymirjar Lord's Legplates", 15, "Heroic"),
        (51477, "Wrathful Gladiator's Scaled Legguards", 21, "Normal"),
        (50081, "Ymirjar Lord's Legplates", 15, "Normal"),
    ],
    'Hands': [
        (49995, "Fallen Lord's Handguards", 7, "Normal"),
        (50650, "Fallen Lord's Handguards", 7, "Heroic"),
        (51172, "Sanctified Lightsworn Handguards", 7, "Normal"),
        (51267, "Sanctified Lightsworn Handguards", 8, "Heroic"),
        (51132, "Sanctified Scourgelord Handguards", 7, "Normal"),
        (51307, "Sanctified Scourgelord Handguards", 8, "Heroic"),
        (51475, "Wrathful Gladiator's Scaled Gauntlets", 14, "Normal"),
    ],
    'Wrist': [
        (49960, "Bracers of Dark Reckoning", 16, "Normal"),
        (50611, "Bracers of Dark Reckoning", 17, "Heroic"),
        (53112, "Bracers of the Heir", 31, "Normal"),
        (54559, "Bracers of the Heir", 33, "Heroic"),
        (51364, "Wrathful Gladiator's Bracers of Triumph", 8, "Normal"),
    ],
}

# ========== SECONDARY TABLE DATA (extra items at the bottom) ==========
# Only add if not already in primary. Use first occurrence price for duplicates.

secondary_items_raw = [
    # (id, name, slot_hint, price)
    (50097, "Scourgelord Legplates", "Legs", 13),
    (51683, "Scourgelord Legplates", "Legs", 13),
    (50002, "Polar Bear Claw Bracers", "Wrist", 14),
    (50659, "Polar Bear Claw Bracers", "Wrist", 14),
    (51130, "Sanctified Scourgelord Pauldrons", "Shoulder", 9),
    (51309, "Sanctified Scourgelord Pauldrons", "Shoulder", 9),
    (34180, "Felfury Legplates", "Legs", 5),
    (51171, "Sanctified Lightsworn Legguards", "Legs", 5),
    (51268, "Sanctified Lightsworn Legguards", "Legs", 5),
    (50020, "Raging Behemoth's Shoulderplates", "Shoulder", 11),
    (50674, "Raging Behemoth's Shoulderplates", "Shoulder", 11),
    (51214, "Sanctified Ymirjar Lord's Battleplate", "Chest", 24),
    (51225, "Sanctified Ymirjar Lord's Battleplate", "Chest", 24),
    (51161, "Sanctified Lightsworn Legplates", "Legs", 15),
    (51278, "Sanctified Lightsworn Legplates", "Legs", 15),
    (51215, "Sanctified Ymirjar Lord's Pauldrons", "Shoulder", 10),
    (51224, "Sanctified Ymirjar Lord's Pauldrons", "Shoulder", 10),
    (48685, "Polished Breastplate of Valor", "Chest", 9),
    (51563, "Taiga Bindings", "Wrist", 18),
    (51832, "Taiga Bindings", "Wrist", 18),
    (34388, "Pauldrons of Berserking", "Shoulder", 3),
    (50037, "Fleshrending Gauntlets", "Hands", 5),
    (50690, "Fleshrending Gauntlets", "Hands", 5),
    (51217, "Sanctified Ymirjar Lord's Handguards", "Hands", 8),
    (51222, "Sanctified Ymirjar Lord's Handguards", "Hands", 8),
    (34341, "Borderland Paingrips", "Hands", 6),
    (40831, "Relentless Gladiator's Scaled Helm", "Head", 4),
    (48498, "Koltira's Helmet of Triumph", "Head", 4),
    (48493, "Koltira's Helmet of Triumph", "Head", 4),
    (51542, "Wrathful Gladiator's Plate Gauntlets", "Hands", 9),
    (51164, "Sanctified Lightsworn Battleplate", "Chest", 19),
    (51275, "Sanctified Lightsworn Battleplate", "Chest", 19),
    (34345, "Crown of Anasterian", "Head", 3),
    (50036, "Belt of Broken Bones", "Waist", 7),
    (50691, "Belt of Broken Bones", "Waist", 7),
    (51125, "Sanctified Scourgelord Shoulderplates", "Shoulder", 12),
    (51314, "Sanctified Scourgelord Shoulderplates", "Shoulder", 12),
    (51166, "Sanctified Lightsworn Spaulders", "Shoulder", 16),
    (51273, "Sanctified Lightsworn Spaulders", "Shoulder", 16),
    (51174, "Sanctified Lightsworn Chestguard", "Chest", 9),
    (51265, "Sanctified Lightsworn Chestguard", "Chest", 9),
    (40830, "Relentless Gladiator's Dreadplate Helm", "Head", 7),
    (51474, "Wrathful Gladiator's Scaled Chestpiece", "Chest", 4),
    (51212, "Sanctified Ymirjar Lord's Helmet", "Head", 22),
    (51227, "Sanctified Ymirjar Lord's Helmet", "Head", 22),
    (53487, "Foreshadow Steps", "Feet", 17),
    (54586, "Foreshadow Steps", "Feet", 17),
    (51170, "Sanctified Lightsworn Shoulderguards", "Shoulder", 4),
    (51269, "Sanctified Lightsworn Shoulderguards", "Shoulder", 4),
    (40791, "Relentless Gladiator's Dreadplate Chestpiece", "Chest", 5),
    (50788, "Bone Drake's Enameled Boots", "Feet", 12),
    (51915, "Bone Drake's Enameled Boots", "Feet", 12),
    (50326, "Lightsworn Helmet", "Head", 16),
    (51719, "Lightsworn Helmet", "Head", 16),
]


def run_query(query):
    cmd = f'mysql -h {DB_HOST} -P {DB_PORT} -u {DB_USER} -p{DB_PASS} {DB_NAME} -e "{query}" 2>/dev/null'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout


def main():
    # Step 1: Build primary ID set
    primary_ids = set()
    for slot, items in primary_items.items():
        for item_id, name, price, diff in items:
            primary_ids.add(item_id)
    
    # Step 2: Merge secondary items (only if ID not in primary)
    secondary_seen = set()
    for item_id, name, slot_hint, price in secondary_items_raw:
        if item_id not in primary_ids and item_id not in secondary_seen:
            secondary_seen.add(item_id)
            if slot_hint not in primary_items:
                primary_items[slot_hint] = []
            # Determine difficulty from context (Heroic if ilvl high variant, but we don't have that info)
            # We'll validate against DB
            primary_items[slot_hint].append((item_id, name, price, "Normal"))
    
    # Step 3: Collect all IDs and validate against DB
    all_ids = set()
    for slot, items in primary_items.items():
        for item_id, name, price, diff in items:
            all_ids.add(item_id)
    
    print(f"Total unique Plate item IDs: {len(all_ids)}")
    
    id_list = ','.join(str(i) for i in sorted(all_ids))
    query = f"SELECT entry, name, ItemLevel, InventoryType, subclass FROM item_template WHERE entry IN ({id_list}) ORDER BY entry;"
    output = run_query(query)
    
    db_items = {}
    for line in output.strip().split('\n')[1:]:
        parts = line.split('\t')
        if len(parts) >= 5:
            entry = int(parts[0])
            db_items[entry] = {
                'entry': entry,
                'name': parts[1],
                'ilvl': int(parts[2]),
                'inv_type': int(parts[3]),
                'subclass': int(parts[4]),
            }
    
    print(f"Found {len(db_items)} items in DB\n")
    
    # Step 4: Validate slots against DB and reorganize if needed
    final_items = {}  # slot -> list of (id, db_name, price, difficulty)
    
    for slot, items in primary_items.items():
        for item_id, name, price, diff in items:
            if item_id in db_items:
                db_item = db_items[item_id]
                actual_slot = INVENTORY_TYPE_MAP.get(db_item['inv_type'], slot)
                db_name = db_item['name']
                
                if actual_slot != slot:
                    print(f"  ⚠️  ID {item_id} ({name}): listed as {slot}, DB says {actual_slot} — FIXED")
                
                if actual_slot not in final_items:
                    final_items[actual_slot] = []
                
                # Use DB name for accuracy
                final_items[actual_slot].append((item_id, db_name, price, diff))
            else:
                print(f"  ❌ ID {item_id} ({name}) NOT found in DB — skipping")
    
    # Remove duplicate IDs per slot (keep first occurrence)
    for slot in final_items:
        seen = set()
        deduped = []
        for item_id, name, price, diff in final_items[slot]:
            if item_id not in seen:
                seen.add(item_id)
                deduped.append((item_id, name, price, diff))
        final_items[slot] = deduped
    
    # Step 5: Write Plate sections to each MD file
    print()
    for slot in ['Head', 'Shoulder', 'Chest', 'Hands', 'Waist', 'Legs', 'Feet', 'Wrist']:
        items = final_items.get(slot, [])
        if not items:
            print(f"  No Plate items for {slot}")
            continue
        
        filepath = os.path.join(BASE_DIR, f"{slot}.md")
        
        if not os.path.exists(filepath):
            print(f"  ❌ File {filepath} not found — skipping")
            continue
        
        # Read current content
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Check if Plate section already exists
        if '## Plate' in content:
            # Remove old Plate section  
            # Find the start of ## Plate
            plate_start = content.index('## Plate')
            # Find the next ## section or end of file
            rest = content[plate_start + len('## Plate'):]
            next_section = rest.find('\n## ')
            if next_section != -1:
                plate_end = plate_start + len('## Plate') + next_section
            else:
                plate_end = len(content)
            content = content[:plate_start].rstrip() + '\n\n' + content[plate_end:].lstrip()
        
        # Build Plate section
        plate_section = "## Plate\n\n"
        plate_section += "| ID | Nome | Preço (dias) | Dificuldade |\n"
        plate_section += "| --- | --- | --- | --- |\n"
        
        for item_id, name, price, diff in sorted(items, key=lambda x: x[0]):
            plate_section += f"| {item_id} | {name} | {price} | {diff} |\n"
        
        # Append to end of file (before trailing newlines)
        content = content.rstrip() + '\n\n' + plate_section + '\n'
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"  ✅ {slot}.md — Added {len(items)} Plate items")
    
    print("\nDone!")


if __name__ == "__main__":
    main()
