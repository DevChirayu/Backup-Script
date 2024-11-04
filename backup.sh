#!/bin/bash

backup_dir="/tmp/"

# Check if source path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_path>"
    exit 1
fi

source_path="$1"

# Check if the source path exists
if [ ! -e "$source_path" ]; then
    echo "Error: Source path does not exist: $source_path"
    exit 1
fi

# Check for permission issues
if [ ! -r "$source_path" ]; then
    echo "Error: No read permission for the source path: $source_path"
    exit 1
fi

if [ ! -w "$backup_dir" ]; then
    echo "Error: No write permission for the backup directory: $backup_dir"
    exit 1
fi

# Create a timestamped backup of the source path
backup_file="$backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz"
tar -czf "$backup_file" -C "$(dirname "$source_path")" "$(basename "$source_path")"

echo "Backup of $source_path created at $backup_file"
