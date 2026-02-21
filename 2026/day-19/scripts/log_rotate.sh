#!/bin/bash

<< comments
this is log roatating script, it will create a new log file everyday and delete log after 5 days.
usage: log_rotate.sh <argument_1> <arguments_2>
argument_1: log file source path
argument_2: log file destination path
comments

#check the arguments are provided or not

display_usage="Usage: $0 <source path> <destination path>"


if [ $# -ne 2 ]; then
    echo "$display_usage"
    exit 1
fi


source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H:%M:%S')
backup_dir=$2

create_backup() {
    zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" > /dev/null
    if [ $? -eq 0 ]; then #if above command executed successfully then print success message
        echo "Backup created successfully $timestamp"
    fi
}


perform_rotation() {
    backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null))
    # echo "${backups[@]}"
    if [ "${#backups[@]}" -gt 5 ]; then
        echo "Deleting rotated log files"

        remove_backups=("${backups[@]:5}")
        echo "${remove_backups[@]}" > /dev/null
        for backup in "${remove_backups[@]}";
        do
            rm -f "${backup}"
        done

    fi
}


create_backup
perform_rotation








