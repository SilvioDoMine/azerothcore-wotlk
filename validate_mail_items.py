#!/usr/bin/env python3
"""
Validates Mail items in our MD files against the live AzerothCore database.
Checks: slot correctness, missing items, item names.
"""

import subprocess
import re
import os
import json

# Database config
DB_HOST = "69.62.88.216"
DB_PORT = "3306"
DB_USER = "silvio"
DB_PASS = "zenha123"
DB_NAME = "acore_world"

# InventoryType mapping (WoW)
INVENTORY_TYPE_MAP = {
    0: "Non-equippable",
    1: "Head",
    2: "Neck",
    3: "Shoulder",
    4: "Shirt",
    5: "Chest",
    6: "Waist",
    7: "Legs",
    8: "Feet",
    9: "Wrist",
    10: "Hands",
    11: "Finger",
    12: "Trinket",
    13: "One-Hand",
    14: "Shield",
    15: "Ranged",
    16: "Cloak",
    17: "Two-Hand",
    18: "Bag",
    19: "Tabard",
    20: "Chest (Robe)",
    21: "Main Hand",
    22: "Off Hand",
    23: "Holdable",
    24: "Ammo",
    25: "Thrown",
    26: "Ranged Right",
    28: "Relic",
}

# Subclass mapping for Armor (class=4)
SUBCLASS_MAP = {
    0: "Misc",
    1: "Cloth",
    2: "Leather",
    3: "Mail",
    4: "Plate",
    5: "Buckler (obsolete)",
    6: "Shield",
    7: "Libram",
    8: "Idol",
    9: "Totem",
    10: "Sigil",
}

BASE_DIR = '/Users/arthurhenrique/work/azerothcore-wotlk/Itens_VIP_Markdown/Itens de corpo'

# Slot files and which slot they represent
SLOT_FILES = {
    'Head.md': 'Head',
    'Shoulder.md': 'Shoulder',
    'Chest.md': 'Chest',
    'Hands.md': 'Hands',
    'Waist.md': 'Waist',
    'Legs.md': 'Legs',
    'Feet.md': 'Feet',
    'Wrist.md': 'Wrist',
}

# Map our slot names to InventoryType IDs
SLOT_TO_INVTYPE = {
    'Head': [1],
    'Shoulder': [3],
    'Chest': [5, 20],  # 5=Chest, 20=Robe (both are chest)
    'Hands': [10],
    'Waist': [6],
    'Legs': [7],
    'Feet': [8],
    'Wrist': [9],
}


def run_query(query):
    """Run a MySQL query and return the output."""
    cmd = f'mysql -h {DB_HOST} -P {DB_PORT} -u {DB_USER} -p{DB_PASS} {DB_NAME} -e "{query}" 2>/dev/null'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout


def parse_md_mail_items(filepath, expected_slot):
    """Parse a slot MD file and extract Mail section items."""
    items = []
    in_mail_section = False
    
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    for line in lines:
        stripped = line.strip()
        
        # Track sections
        if stripped.startswith('## '):
            section = stripped.replace('## ', '')
            in_mail_section = (section == 'Mail')
            continue
        
        if in_mail_section and stripped.startswith('|') and '---' not in stripped:
            parts = [p.strip() for p in stripped.split('|')]
            parts = [p for p in parts if p]
            
            if len(parts) >= 4 and parts[0] != 'ID':
                items.append({
                    'id': int(parts[0]),
                    'name': parts[1],
                    'price': parts[2],
                    'difficulty': parts[3],
                    'file_slot': expected_slot,
                })
    
    return items


def main():
    # 1. Collect all Mail item IDs from our MDs
    all_md_items = []
    for filename, slot in SLOT_FILES.items():
        filepath = os.path.join(BASE_DIR, filename)
        if os.path.exists(filepath):
            items = parse_md_mail_items(filepath, slot)
            all_md_items.extend(items)
    
    all_ids = list(set(item['id'] for item in all_md_items))
    
    if not all_ids:
        print("No Mail items found in MD files!")
        return
    
    print(f"Found {len(all_md_items)} Mail item entries across {len(SLOT_FILES)} slot files ({len(all_ids)} unique IDs)")
    
    # 2. Query the database for all these items
    id_list = ','.join(str(i) for i in sorted(all_ids))
    query = f"SELECT entry, name, ItemLevel, InventoryType, subclass, class FROM item_template WHERE entry IN ({id_list}) ORDER BY entry;"
    
    output = run_query(query)
    
    # Parse DB results
    db_items = {}
    for line in output.strip().split('\n')[1:]:  # skip header
        parts = line.split('\t')
        if len(parts) >= 6:
            entry = int(parts[0])
            db_items[entry] = {
                'entry': entry,
                'name': parts[1],
                'ilvl': int(parts[2]),
                'inv_type': int(parts[3]),
                'subclass': int(parts[4]),
                'item_class': int(parts[5]),
            }
    
    print(f"Found {len(db_items)} items in the database\n")
    
    # 3. Compare: Check slot correctness
    print("=" * 80)
    print("🔴 ITEMS IN WRONG SLOT")
    print("=" * 80)
    wrong_slot_count = 0
    for item in all_md_items:
        if item['id'] in db_items:
            db_item = db_items[item['id']]
            expected_inv_types = SLOT_TO_INVTYPE.get(item['file_slot'], [])
            actual_inv_type = db_item['inv_type']
            
            if actual_inv_type not in expected_inv_types:
                actual_slot_name = INVENTORY_TYPE_MAP.get(actual_inv_type, f"Unknown({actual_inv_type})")
                print(f"  ❌ ID {item['id']} ({item['name']})")
                print(f"     MD Slot: {item['file_slot']} | DB Slot: {actual_slot_name} (InvType={actual_inv_type})")
                print(f"     DB Subclass: {SUBCLASS_MAP.get(db_item['subclass'], 'Unknown')}")
                print()
                wrong_slot_count += 1
    
    if wrong_slot_count == 0:
        print("  ✅ All items are in the correct slot!\n")
    
    # 4. Check: Items NOT in database
    print("=" * 80)
    print("🟡 ITEMS NOT FOUND IN DATABASE")
    print("=" * 80)
    missing_count = 0
    for item_id in sorted(all_ids):
        if item_id not in db_items:
            matching = [i for i in all_md_items if i['id'] == item_id]
            if matching:
                print(f"  ⚠️  ID {item_id} ({matching[0]['name']}) - NOT in database")
                missing_count += 1
    
    if missing_count == 0:
        print("  ✅ All items exist in the database!\n")
    
    # 5. Check: Name mismatches
    print()
    print("=" * 80)
    print("🟠 NAME MISMATCHES")
    print("=" * 80)
    name_mismatch_count = 0
    for item in all_md_items:
        if item['id'] in db_items:
            db_name = db_items[item['id']]['name']
            if db_name != item['name']:
                print(f"  📝 ID {item['id']}")
                print(f"     MD:  {item['name']}")
                print(f"     DB:  {db_name}")
                print()
                name_mismatch_count += 1
    
    if name_mismatch_count == 0:
        print("  ✅ All item names match!\n")
    
    # 6. Check: Items that are NOT Mail
    print()
    print("=" * 80)
    print("🔵 ITEMS THAT ARE NOT MAIL ARMOR")
    print("=" * 80)
    not_mail_count = 0
    for item in all_md_items:
        if item['id'] in db_items:
            db_item = db_items[item['id']]
            if db_item['item_class'] != 4 or db_item['subclass'] != 3:
                class_name = "Armor" if db_item['item_class'] == 4 else f"Class={db_item['item_class']}"
                sub_name = SUBCLASS_MAP.get(db_item['subclass'], f"Subclass={db_item['subclass']}")
                print(f"  ⚠️  ID {item['id']} ({item['name']})")
                print(f"     Expected: Mail Armor | Actual: {class_name} / {sub_name}")
                print()
                not_mail_count += 1
    
    if not_mail_count == 0:
        print("  ✅ All items are Mail armor!\n")
    
    # 7. Also check the user's new list items to see if they're in our MDs
    print()
    print("=" * 80) 
    print("📊 SUMMARY")
    print("=" * 80)
    print(f"  Total MD entries: {len(all_md_items)}")
    print(f"  Unique IDs: {len(all_ids)}")
    print(f"  Found in DB: {len(db_items)}")
    print(f"  Wrong slot: {wrong_slot_count}")
    print(f"  Missing from DB: {missing_count}")
    print(f"  Name mismatches: {name_mismatch_count}")
    print(f"  Not Mail armor: {not_mail_count}")


if __name__ == "__main__":
    main()
