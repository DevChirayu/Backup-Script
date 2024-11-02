#!/bin/bash

backup_dir="/tmp/"
source_dir="/home/chirayupatilubuntu/trial/my_project/"

#Create a timestamped backup of the source directory
tar -czf "$backup_dir/backup_$(date +%Y%m%d_%H%M%S).tar.gz" -C "$source_dir" .

echo "Backup of $source_dir created at $backup_dir"