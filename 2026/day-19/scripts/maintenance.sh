#!/bin/bash

set -e

LOG_FILE="/var/log/maintenance.log"

exec >> "$LOG_FILE" 2>&1

echo "Starting maintenance tasks at $(date)"



/Users/fahadjaseem/Documents/work/90DaysOfDevOps/2026/day-19/scripts/log_rotate.sh /var/log/myapp /var/log/archive
/Users/fahadjaseem/Documents/work/90DaysOfDevOps/2026/day-19/scripts/backup.sh /var/log/html /backups/webserver 

echo "Maintenance tasks completed at $(date)"
echo "---------------------------------------" #readable log separation

