# Linux Fundamentals – Practice Note
## Check Running Processes
### `1.`  `ps aux | head`
Show all running processes and their **PID**,**CPU Usage**,**Memory Usage**.

### `2.` `top`
Display real-time CPU and Memory usage, useful for identifying high resource-consuming processes.

## Inspect a systemd Service
### service inspected: `cron`
### `3.` `systemctl status cron`
cron service is active and running, shows main PID and recent activity.

### `4.` `systemctl list-units --type=service | grep cron`
list only active service of cron

### `5.` `systemctl list-units | grep cron`
This includes services, sockets, timer, mounts related to cron

### `6.` `systemctl is-active cron` and `systemctl is-enabled cron`
Quiickly verify if service is ruunind and enabled or not.

## Check Logs(Troubleshooting)
### `7.` `journalctl -u cron | tail -n 50` or `journalctl -u cron -n 50`
Shows recent **cron** related logs, including login attempts.

### `8.` `journalctl -u cron -r | tail -n 50`
Shows oldest **cron** related logs. **(-r = reverse the order)**

`--since today`= log from today  `--since "1 hour ago"` = log from last hour

### `9.` `tail -n 50 /var/log/auth.log | grep -i cron`
Display authentication logs, useful for debugging **cron** login issues. ** -i for case insensitve match**

## Simple Troubleshooting Flow
### **steps**
- Checked processes using `ps` and `top`
- Verified service status using `systemctl status cron`
- Reviewed logs using `journalctl` and `auth.log`

