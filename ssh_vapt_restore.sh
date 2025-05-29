#!/bin/bash

# Directory containing the crypto policy files
TARGET_DIR="/usr/share/crypto-policies/DEFAULT"

# Find the latest backup directory
LATEST_BACKUP=$(find "$TARGET_DIR" -maxdepth 1 -type d -name 'backup_*' | sort -r | head -n 1)

# Files to restore
FILES=(
    "openssh.txt"
    "opensshserver.txt"
    "libssh.txt"
)

if [[ -z "$LATEST_BACKUP" ]]; then
    echo "❌ No backup directory found in $TARGET_DIR"
    exit 1
fi

echo "🔄 Restoring from: $LATEST_BACKUP"

# Restore files
for file in "${FILES[@]}"; do
    src="${LATEST_BACKUP}/${file}.bkp"
    dest="${TARGET_DIR}/${file}"

    if [[ -f "$src" ]]; then
        cp "$src" "$dest"
        echo "✅ Restored $dest from $src"
    else
        echo "⚠️ Backup not found for: $file"
    fi
done
