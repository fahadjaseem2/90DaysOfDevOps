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
timestamps=$(date '+%Y-%m-%d')
backup_dir=$2

create_backup() {
    if tar -czf "${backup_dir}/backup_${timestamps}.tar.gz" "${source_dir}" 2>/dev/null; then
    #echo "backup created succefully ${timestamps}"
        if [ -s "${backup_dir}/backup_${timestamps}.tar.gz" ]; then # -s checks if the file is exists and is not empty
            echo "Backup Archive is created succussefully"
        else
            echo "Backup Archive is Empty"
            exit 1
        fi
    else
        echo "Backup Archive creation failed"
        exit 1
    fi 

    << old_script
        echo "Backup Archive is created succussefully ${backup_dir}/backup_${timestamps}.tar.gz"
        echo "Backup Archive Name: backup_${timestamps}.tar.gz"
        echo "Backup Archive Size: $(du -h "${backup_dir}/backup_${timestamps}.tar.gz")"
    else

        echo "Backup Archive creation failed"
        exit 1
        
    fi
    old_script
}

create_backup



