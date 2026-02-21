#!/bin/bash

<< info
take source directory and backup directory as arguments and create time stamped backup .tar.gz
(eg backup-2026-02-21.tar.gz)
Verfify the backup directory created succefully or not also print archive faile name and size
Rotate backup file and remove backup file older than 14 days from destination
Handling error also
info

display_usage="Usage: $0 <source_dir> <backup_dir>"

check_usage() {
    if  [ $# -ne 2 ]; then
        echo "$display_usage"
        exit 1
    fi
}
check_usage "$@"

source_dir=$1
timestamps=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

create_backup() {
    if tar -czf "${backup_dir}/backup_${timestamps}.tar.gz" "${source_dir}"; then #2>/dev/null
    #echo "backup created succefully ${timestamps}"
        if [ -s "${backup_dir}/backup_${timestamps}.tar.gz" ]; then # -s checks if the file is exists and is not empty

            echo "Backup Archive is created succussefully ${backup_dir}/backup_${timestamps}.tar.gz"
            echo "Backup Archive Name: backup_${timestamps}.tar.gz"
            echo "Backup Archive Size: $(du -h "${backup_dir}/backup_${timestamps}.tar.gz")"
        else

            echo "Backup Archive creation failed"
            exit 1
        fi
    else
        echo "Backup Archive creation failed"
        exit 1
    fi
}
    


perform_rotation() {
    echo "Checking for backups older than 14 days"
    old_backups=$(find "${backup_dir}" -name "backup_*.tar.gz" -type f -mtime +14)
    if [ -n "$old_backups" ]; then # -n checks if the variable is not empty
        echo "Removing Old Backups"

        for old_backup in $old_backups;
        do 
            rm -f "$old_backup"
            echo "Removed: $old_backup"
        done
    else
        echo "No Old Backups Found"
    fi
 }





create_backup
perform_rotation




