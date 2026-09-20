#!/bin/bash
set -e

BASE="/srv/personal-cloud"

sudo mkdir -p \
    "$BASE/app" \
    "$BASE/config" \
    "$BASE/storage/users" \
    "$BASE/logs" \
    "$BASE/backups"

sudo touch "$BASE/config/app.conf"
sudo touch "$BASE/storage/users/.storage-test"

echo "Personal Cloud Storage directories created."
