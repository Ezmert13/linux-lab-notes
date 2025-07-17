#!/bin/bash

# backup-home.sh


timestamp=$(date +"%Y-%m-%d_%H-%M")
backup_dir="/home/ubuntu/backups"
mkdir -p "$backup_dir"

tar -czf "$backup_dir/home-backup-$timestamp.tar.gz" /home/ubuntu 2>/dev/null

echo "Backup completed at $timestamp"
