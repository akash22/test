#!/bin/bash

# Directory containing the crypto policy files
TARGET_DIR="/usr/share/crypto-policies/DEFAULT"

# Files to backup
FILES=(
    "openssh.txt"
    "opensshserver.txt"
    "libssh.txt"
)

# Timestamp for uniqueness
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup directory
BACKUP_DIR="${TARGET_DIR}/backup_${TIMESTAMP}"
mkdir -p "$BACKUP_DIR"

# Backup files
for file in "${FILES[@]}"; do
    src="${TARGET_DIR}/${file}"
    dest="${BACKUP_DIR}/${file}.bkp"

    if [[ -f "$src" ]]; then
        cp "$src" "$dest"
        echo "✅ Backed up $src to $dest"
    else
        echo "⚠️ File not found: $src"
    fi
done
