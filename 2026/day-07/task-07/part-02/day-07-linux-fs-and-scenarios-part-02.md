# Part 2: Scenario-Based Practice (Troubleshooting Flow)
## Scenario 1: Service Not Starting
**A web application service called myapp failed to start after a server reboot**

**Step 1.**
`systemctl status myapp` (Service status)

**Why:** 
Confirms whether the service is running, failed, inactive, or not found.

**Step 2.** `journalctl -u myapp -n 50`  (recent logs)

**Why:** 
To read the specific error messages from the application's stdout/stderr. If it's a code error or a missing file, the answer is here.

**Step 3.** 
`systemctl is-enabled myapp` 

**Why:** 
Checks auto-start on boot; enable if disabled.

**Step 4.**
`systemctl list-units --type=service | grep myapp`  (List all service)

**Why:**
Ensures the service actually exists and checks its correct name.

---

## Scenario 2: High CPU Usage
**application server is slow.**

**Step 1.**
`top` or `htop` (Real time cpu usage)

**Why:**
Live view; identifies top consumer instantly (q to quit)

**Step 2.**
`ps aux --sort=-%cpu | head -10`

**Why:**
To get a static "snapshot" of the top 10 CPU-consuming processes.

**Step 3.**
`ps -o pid,pcpu,pmem,comm -p <High_cpu_usage_PID>`

**Why:**
To identify the specific Process ID (PID) so I can further investigate that specific instance or terminate it if it's a zombie process.

---

## Scenario 3: Finding Service Logs (Docker)
**Step 1.**
`systemctl status docker`

**Why:**
Confirms service exists; shows last journal snippet.

**Step 2.**
`journalctl -u docker | tail -n 50`

**Why:**
Last 50 lines for recent errors/pulls.

**Step 3.**
`journalctl -u docker -f`

**Why:**
Real-time tail; monitor during reproduction.

---

## Scenario 4: File Permission Issue
**A script at /home/user/backup.sh is not executing.**
**When you run it: ./backup.sh**
**You get: "Permission denied"**

**Step 1.**
`ls -l /home/user/backup.sh`

**Why:**
To confirm the current permission bits and see who owns the file.

**Step 2.**
`chmod 755 /home/user/backup.sh`

**Why:**
Adds execute permission for owner/group/other to run as scripts..

**Step 3.**
`ls -l /home/user/backup.sh`

**Why:**
To verify the change. The filename usually changes color (often to green) in most terminals once it's executable.

**Step 4.**
`./backup.sh`

**Why:**
To confirm the fix actually allows the script to run.
