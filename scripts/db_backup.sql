#!/bin/bash
set -e

echo "Starting PostgreSQL backup using Docker container..."

mkdir -p backup/pgdump/ Homeroute/backup/

BACKUP_FILE="backup/pgdump/backup_$(date +%Y%m%d_%H%M).sql"

# Use the pg_dump inside the container (version 18)
pg_dump "$DATABASE_URL" -Fc -f "$BACKUP_FILE"

Homeroute_BACKUP_FILE="Homeroute/backup/$(basename "$BACKUP_FILE")"
cp -f "$BACKUP_FILE" "$Homeroute_BACKUP_FILE"

echo "Backup completed successfully:"
echo "- $BACKUP_FILE"
echo "- $Homeroute_BACKUP_FILE"
