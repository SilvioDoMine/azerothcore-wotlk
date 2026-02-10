#!/usr/bin/env python3
"""
Reorganizes body equipment items from armor-type files (Cloth, Leather, Mail, Plate)
into slot-based files (Head, Shoulder, Chest, Hands, Waist, Legs, Feet, Wrist).
"""

import os
import re
from collections import defaultdict

BASE_DIR = '/Users/arthurhenrique/work/azerothcore-wotlk/Itens_VIP_Markdown/Itens de corpo'

# Mapping of slot names found in files to normalized slot names
SLOT_NORMALIZE = {
    'HEAD': 'Head',
    'SHOULDER': 'Shoulder',
    'SHOULDERS': 'Shoulder',
    'CHEST': 'Chest',
    'HANDS': 'Hands',
    'WAIST': 'Waist',
    'LEGS': 'Legs',
    'FEET': 'Feet',
    'WRIST': 'Wrist',
}

# PT-BR titles for the output files
SLOT_TITLES = {
    'Head': '🪖 Head (Cabeça)',
    'Shoulder': '🧥 Shoulder (Ombros)',
    'Chest': '🧥 Chest (Peitoral)',
    'Hands': '🧤 Hands (Mãos)',
    'Waist': '🧷 Waist (Cintura)',
    'Legs': '🦵 Legs (Pernas)',
    'Feet': '🥾 Feet (Botas)',
    'Wrist': '🧿 Wrist (Braçadeiras)',
}

# Desired slot order for readability
SLOT_ORDER = ['Head', 'Shoulder', 'Chest', 'Hands', 'Waist', 'Legs', 'Feet', 'Wrist']

# Files to process (armor types)
ARMOR_FILES = ['Cloth.md', 'Leather.md', 'Mail.md', 'Plate.md']


def parse_standard_file(filepath, armor_type):
    """
    Parse files with format: ID | Nome | Preço (dias) | Slot | Dificuldade
    Used for Cloth, Mail, Plate.
    Returns dict of slot -> list of item dicts.
    """
    items_by_slot = defaultdict(list)
    current_slot = None

    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    for line in lines:
        stripped = line.strip()

        # Check for slot header (e.g., "HEAD", "SHOULDER", "SHOULDERS")
        upper = stripped.upper()
        if upper in SLOT_NORMALIZE:
            current_slot = SLOT_NORMALIZE[upper]
            continue

        # Skip empty lines, title lines, separator lines, header lines
        if not stripped or stripped.startswith('#') or stripped.startswith('🧾') or stripped.startswith('📋'):
            continue

        # Parse table rows
        if stripped.startswith('|') and '---' not in stripped:
            parts = [p.strip() for p in stripped.split('|')]
            # Remove empty first/last from splitting on |
            parts = [p for p in parts if p]

            if len(parts) >= 5 and current_slot:
                # Check if this is a header row
                if parts[0].upper() == 'ID':
                    continue

                item_id = parts[0]
                nome = parts[1]
                preco = parts[2]
                slot_from_table = parts[3]
                dificuldade = parts[4]

                items_by_slot[current_slot].append({
                    'id': item_id,
                    'nome': nome,
                    'preco': preco,
                    'slot': slot_from_table,
                    'dificuldade': dificuldade,
                    'armor_type': armor_type,
                })

    return items_by_slot


def parse_leather_file(filepath, armor_type):
    """
    Parse Leather file with format: ID | Nome | ilvl | Tipo | Preço
    Returns dict of slot -> list of item dicts.
    """
    items_by_slot = defaultdict(list)
    current_slot = None

    # Map the emoji/PT-BR section titles to slot names
    section_map = {
        'luvas': 'Hands',
        'peito': 'Chest',
        'cabeça': 'Head',
        'pernas': 'Legs',
        'botas': 'Feet',
        'cintos': 'Waist',
        'braçadeiras': 'Wrist',
        'ombros': 'Shoulder',
    }

    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    for line in lines:
        stripped = line.strip()

        # Check for section headers like "🧤 Luvas (Slot 10)"
        for key, slot in section_map.items():
            if key.lower() in stripped.lower() and ('🧤' in stripped or '🧥' in stripped or '🪖' in stripped or '🦵' in stripped or '🥾' in stripped or '🧷' in stripped or '🧿' in stripped):
                current_slot = slot
                break

        # Also check for bare slot names
        upper = stripped.upper()
        if upper in SLOT_NORMALIZE:
            current_slot = SLOT_NORMALIZE[upper]
            continue

        # Skip non-table lines
        if not stripped or stripped.startswith('#') or stripped.startswith('📋') or stripped.startswith('🧾'):
            continue

        # Parse table rows
        if stripped.startswith('|') and '---' not in stripped:
            parts = [p.strip() for p in stripped.split('|')]
            parts = [p for p in parts if p]

            if len(parts) >= 5 and current_slot:
                # Check if header row
                if parts[0].upper() == 'ID':
                    continue

                item_id = parts[0]
                nome = parts[1]
                # ilvl = parts[2]  # not used in final output, Preço is what matters
                # tipo = parts[3]  # "Normal"/"Heroic" or overridden
                preco = parts[4]
                dificuldade = parts[3]  # Tipo column in leather = Normal/Heroic

                items_by_slot[current_slot].append({
                    'id': item_id,
                    'nome': nome,
                    'preco': preco,
                    'slot': current_slot,
                    'dificuldade': dificuldade,
                    'armor_type': armor_type,
                })

    return items_by_slot


def main():
    # Collect all items grouped by slot
    all_items_by_slot = defaultdict(list)

    for armor_file in ARMOR_FILES:
        filepath = os.path.join(BASE_DIR, armor_file)
        if not os.path.exists(filepath):
            print(f"Warning: {filepath} not found, skipping.")
            continue

        armor_type = armor_file.replace('.md', '')
        print(f"Parsing {armor_file} ({armor_type})...")

        if armor_type == 'Leather':
            items = parse_leather_file(filepath, armor_type)
        else:
            items = parse_standard_file(filepath, armor_type)

        for slot, item_list in items.items():
            all_items_by_slot[slot].extend(item_list)
            print(f"  Found {len(item_list)} items in slot '{slot}'")

    # Generate new MD files per slot
    print(f"\nGenerating new slot-based .md files...")
    for slot in SLOT_ORDER:
        items = all_items_by_slot.get(slot, [])
        if not items:
            print(f"  No items found for slot '{slot}', skipping.")
            continue

        title = SLOT_TITLES.get(slot, slot)
        filename = f"{slot}.md"
        filepath = os.path.join(BASE_DIR, filename)

        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(f"# {title}\n\n")
            f.write(f"> Itens VIP de corpo — Slot: **{slot}**\n\n")

            # Group by armor type within each slot for readability
            armor_types_in_slot = sorted(set(item['armor_type'] for item in items))

            for armor in armor_types_in_slot:
                armor_items = [item for item in items if item['armor_type'] == armor]

                f.write(f"## {armor}\n\n")
                f.write("| ID | Nome | Preço (dias) | Dificuldade |\n")
                f.write("| --- | --- | --- | --- |\n")

                for item in armor_items:
                    f.write(f"| {item['id']} | {item['nome']} | {item['preco']} | {item['dificuldade']} |\n")

                f.write("\n")

        print(f"  Created {filename} with {len(items)} items ({', '.join(armor_types_in_slot)})")

    # Delete old armor-type files
    print(f"\nDeleting old armor-type files...")
    for armor_file in ARMOR_FILES:
        filepath = os.path.join(BASE_DIR, armor_file)
        if os.path.exists(filepath):
            os.remove(filepath)
            print(f"  Deleted {armor_file}")
        else:
            print(f"  {armor_file} not found (already deleted?)")

    print("\nDone! Reorganization complete.")


if __name__ == "__main__":
    main()
