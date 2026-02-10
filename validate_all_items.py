#!/usr/bin/env python3
"""
Validates ALL armor type items (Cloth, Leather, Mail, Plate) in MD files against the live DB.
"""

import subprocess
import os

DB_HOST = "69.62.88.216"
DB_PORT = "3306"
DB_USER = "silvio"
DB_PASS = "zenha123"
DB_NAME = "acore_world"

INVENTORY_TYPE_MAP = {
    1: 'Head', 3: 'Shoulder', 5: 'Chest', 6: 'Waist',
    7: 'Legs', 8: 'Feet', 9: 'Wrist', 10: 'Hands', 20: 'Chest',
}

SUBCLASS_MAP = {0: "Misc", 1: "Cloth", 2: "Leather", 3: "Mail", 4: "Plate", 6: "Shield"}

SLOT_TO_INVTYPE = {
    'Head': [1], 'Shoulder': [3], 'Chest': [5, 20], 'Hands': [10],
    'Waist': [6], 'Legs': [7], 'Feet': [8], 'Wrist': [9],
}

BASE_DIR = '/Users/arthurhenrique/work/azerothcore-wotlk/Itens_VIP_Markdown/Itens de corpo'
SLOT_FILES = ['Head.md', 'Shoulder.md', 'Chest.md', 'Hands.md', 'Waist.md', 'Legs.md', 'Feet.md', 'Wrist.md']
ARMOR_TYPES = ['Cloth', 'Leather', 'Mail', 'Plate']


def run_query(query):
    cmd = f'mysql -h {DB_HOST} -P {DB_PORT} -u {DB_USER} -p{DB_PASS} {DB_NAME} -e "{query}" 2>/dev/null'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout


def parse_md_file(filepath, expected_slot):
    items = []
    current_section = None

    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    for line in lines:
        stripped = line.strip()
        if stripped.startswith('## '):
            current_section = stripped.replace('## ', '')
            continue
        if current_section in ARMOR_TYPES and stripped.startswith('|') and '---' not in stripped:
            parts = [p.strip() for p in stripped.split('|')]
            parts = [p for p in parts if p]
            if len(parts) >= 4 and parts[0] != 'ID':
                items.append({
                    'id': int(parts[0]),
                    'name': parts[1],
                    'armor_type': current_section,
                    'file_slot': expected_slot,
                })
    return items


def main():
    all_items = []
    for filename in SLOT_FILES:
        slot = filename.replace('.md', '')
        filepath = os.path.join(BASE_DIR, filename)
        if os.path.exists(filepath):
            items = parse_md_file(filepath, slot)
            all_items.extend(items)

    all_ids = list(set(item['id'] for item in all_items))
    print(f"Total entries: {len(all_items)} | Unique IDs: {len(all_ids)}")

    id_list = ','.join(str(i) for i in sorted(all_ids))
    query = f"SELECT entry, name, ItemLevel, InventoryType, subclass FROM item_template WHERE entry IN ({id_list}) ORDER BY entry;"
    output = run_query(query)

    db_items = {}
    for line in output.strip().split('\n')[1:]:
        parts = line.split('\t')
        if len(parts) >= 5:
            entry = int(parts[0])
            db_items[entry] = {
                'name': parts[1], 'ilvl': int(parts[2]),
                'inv_type': int(parts[3]), 'subclass': int(parts[4]),
            }

    print(f"Found in DB: {len(db_items)}\n")

    # Check wrong slots
    wrong = 0
    for item in all_items:
        if item['id'] in db_items:
            db = db_items[item['id']]
            expected = SLOT_TO_INVTYPE.get(item['file_slot'], [])
            if db['inv_type'] not in expected:
                actual = INVENTORY_TYPE_MAP.get(db['inv_type'], f"Unknown({db['inv_type']})")
                print(f"  ❌ WRONG SLOT: {item['id']} ({item['name']}) [{item['armor_type']}]")
                print(f"     File: {item['file_slot']} | DB: {actual}")
                wrong += 1

    # Check name mismatches
    name_issues = 0
    for item in all_items:
        if item['id'] in db_items:
            if db_items[item['id']]['name'] != item['name']:
                print(f"  📝 NAME MISMATCH: {item['id']}")
                print(f"     MD: {item['name']} | DB: {db_items[item['id']]['name']}")
                name_issues += 1

    # Check not found
    missing = [i for i in all_ids if i not in db_items]

    print(f"\n{'='*60}")
    print(f"📊 VALIDATION SUMMARY")
    print(f"{'='*60}")
    print(f"  Total entries: {len(all_items)}")
    print(f"  Unique IDs: {len(all_ids)}")
    print(f"  Found in DB: {len(db_items)}")
    print(f"  Wrong slot: {wrong} {'✅' if wrong == 0 else '❌'}")
    print(f"  Name mismatches: {name_issues} {'✅' if name_issues == 0 else '⚠️'}")
    print(f"  Missing from DB: {len(missing)} {'✅' if len(missing) == 0 else '❌'}")

    # Per armor type breakdown
    print(f"\n  Per armor type:")
    for at in ARMOR_TYPES:
        count = len([i for i in all_items if i['armor_type'] == at])
        print(f"    {at}: {count} entries")


if __name__ == "__main__":
    main()
