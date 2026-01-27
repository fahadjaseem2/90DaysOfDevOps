# Linux Fundamentals – Practice Note
## Check Running Processes
### `1.`  `ps aux | head`
Show all running processes and their **PID**,**CPU Usage**,**Memory Usage**.

### `2.` `top`
Display real-time CPU and Memory usage, useful for identifying high resource-consuming processes.

## Inspect a systemd Service
### service inspected: `ssh`
### `3.` `systemctl status ssh`
ssh service is active and running, shows main PID and recent activity.

### `4.` `systemctl list-units --type=service | grep ssh`
list only active service of ssh

### `5.` `systemctl list-units | grep ssh`
This includes services, sockets, timer, mounts related to ssh

### `6.` `systemctl is-active ssh` and `systemctl is-enabled ssh`
Quiickly verify if service is ruunind and enabled or not.

## Check Logs(Troubleshooting)
### `7.` `journalctl -u ssh | tail -n 50` or `journalctl -u ssh -n 50`
Shows recent **ssh** related logs, including login attempts.

### `8.` `journalctl -u ssh -r | tail -n 50`
Shows oldest **ssh** related logs. **(-r = reverse the order)**

`--since today`= log from today  `--since "1 hour ago"` = log from last hour

### `9.` `tail -n 50 /var/log/auth.log | grep -i ssh`
Display authentication logs, useful for debugging **ssh** login issues. ** -i for case insensitve match**

## Simple Troubleshooting Flow
### **steps**
- Checked processes using `ps` and `top`
- Verified service status using `systemctl status ssh`
- Reviewed logs using `journalctl` and `auth.log`

