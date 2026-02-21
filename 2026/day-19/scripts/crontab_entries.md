# Log rotation daily at 2 AM
0 2 * * * /Users/fahadjaseem/documents/work/90DaysOfDevOps/2026/day-19/scripts/log_rotate.sh /var/log/myapp >> /var/log/rotate.log 2>&1

# Server backup every Sunday at 3 AM  
0 3 * * 0 /Users/fahadjaseem/documents/work/90DaysOfDevOps/2026/day-19/scripts/backup.sh /etc /backup >> /var/log/backup.log 2>&1

# Daily 1 AM
0 1 * * * /Users/fahadjaseem/documents/work/90DaysOfDevOps/2026/day-19/scripts/maintenance.sh

