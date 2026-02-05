# Day 12 – Breather & Revision (Days 01–11)
## 1. Mindset & Plan Review (Day 01 to 04)
- Initial goal: Build strong Linux foundations for DevOps.
- Status: Goals are still aligned.
- Spend more time validating changes (before/after checks).
- Practice permission + ownership scenarios more deeply.

## 2. Processes & Services Review (Days 04–05)
- `systemctl status nginx` (active)
- `journalctl -u nginx -n 20` (clean access logs)
- `ps aux --sort=-%cpu | head -3` (low CPU)

## 3. File Ops (Days 06-10)
- e`cho "Day12 check" >> ~/notes.txt && ls -l ~/notes.txt` (664)
- `chmod 644 ~/notes.txt`
- c`p ~/notes.txt ~/notes-backup.txt` (Creates a backup copy of the file, Preserves content after verification and permission change)

## 4. User/Group (Day 09-11)
- Recreated: `sudo useradd -m oslo -s /bin/bash`
- `sudo chown oslo:developers ~/notes.txt`
- `id oslo`
- `ls -l ~/notes.txt` → oslo:developers confirmed.

```
```

## Top 3 time-saver commands:
- `ls -l`
- `systemctl status <service>`
- `journalctl -u <service> -n 50`

## Service Health Check:
- `systemctl status <service>`
- `ps aux | grep <service>`
- `journalctl -u <service> -n 50`

## Safe chown/chmod:
- `ls -l <file_name>`
- `sudo chown <user_name>:<group_name> <file_name>`
- `sudo chmod 640 <file_name>`
- `ls -l <file_name>`

## 4. Focus for the Next 3 Days
- Combine ownership + permissions confidently.
- Understanding more complex journalctl flags for deeper troubleshooting.

