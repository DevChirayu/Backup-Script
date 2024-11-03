#!/bin/bash

backup_dir="/tmp/"
source_dir="/home/chirayupatilubuntu/trial/my_project/"

#Check for Permission Issue
if [ ! -w "$backup_dir" ]; then
    echo "Error: No write permission for the backup directory: $backup_dir"
    exit 1
fi

#Create a timestamped backup of the source directory
tar -czf "$backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz" -C "$source_dir" .

echo "Backup of $source_dir created at $backup_dir"