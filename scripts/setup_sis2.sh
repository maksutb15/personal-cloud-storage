#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "Run this script with sudo: sudo ./scripts/setup_sis2.sh"
    exit 1
fi

# Create groups
for group in cloud_admins cloud_auditors cloud_automation cloud_app; do
    getent group "$group" >/dev/null || groupadd "$group"
done

# Create project users if missing
id cloud_auditor >/dev/null 2>&1 || \
    useradd -m -s /usr/sbin/nologin -g cloud_auditors cloud_auditor

id automation_bot >/dev/null 2>&1 || \
    useradd -m -s /bin/bash automation_bot

usermod -aG cloud_automation automation_bot

id cloud_app >/dev/null 2>&1 || \
    useradd -r -s /usr/sbin/nologin -g cloud_app cloud_app

# Create project directories
BASE_DIR="/srv/personal-cloud"
mkdir -p "$BASE_DIR"/{app,config,storage/users,logs,backups}

# Set permissions
chown root:cloud_admins "$BASE_DIR"
chmod 750 "$BASE_DIR"

chown cloud_app:cloud_app "$BASE_DIR/app" "$BASE_DIR/storage" "$BASE_DIR/storage/users"
chmod 750 "$BASE_DIR/app" "$BASE_DIR/storage" "$BASE_DIR/storage/users"

for dir in config logs backups; do
    chown root:cloud_admins "$BASE_DIR/$dir"
    chmod 750 "$BASE_DIR/$dir"
done

echo "SIS2 groups, users and directories configured."
