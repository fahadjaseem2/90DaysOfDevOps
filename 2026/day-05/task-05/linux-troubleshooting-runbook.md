# Mini Troubleshooting Runbook - **cron** Service
### **Target Service** - cron

## 1. Environment Basics
### `uname -a`
**Output Snippet:**
```
Linux ip-172-31-7-78 6.14.0-1018-aws #18~24.04.1-Ubuntu SMP Mon Nov 24 19:46:27 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux
```

**Observation** - Stable LTS kernel deducted (Long Term Support)

### `lsb_release -a`
**Output Snippet:**
```
Distributor ID:	Ubuntu
Description:	Ubuntu 24.04.3 LTS
Release:	24.04
Codename:	noble
```
**Observation** - systemd based OS, logs are store /var/log/auth.log or journalctl


## 2. Filesystem Sanity
### `mkdir /temp/runbook-demo && cp /etc/crontab /tmp/runbook-demo/crontab-demo`
### `ls -l /tmp/runbook-demo`
**Output Snippet:**
```
-rw-r--r-- 1 ubuntu ubuntu 1136 Jan 28 21:13 crontab-copy
```
**Observation** - File system is writable (*if the file system is Read-Only, cron cannot write temp file or update logs*)


## 3. Cpu/Memory
### `ps -o pid,pcpu,pmem,comm -p 517` {517 = cron PID} **or** `ps -C cron -o pid,pcpu,pmem,comm`
**Output Snippet:**
```
  PID %CPU %MEM COMMAND
  517  0.0  0.2 cron
```
**Observation** - cron deamon is running and CPU Usage is 0.0% which is healthy.

### `free -h`
**Output Snippet:**
```
               total        used        free      shared  buff/cache   available
Mem:           914Mi       338Mi       126Mi       2.7Mi       616Mi       575Mi
Swap:             0B          0B          0B
```
**Observation** - Ample memory available


## 4. Disk/IO (input/output)
### `df -h /var`
**Output Snippet:**
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       6.8G  2.3G  4.5G  34% /
```
**Observation** - Sufficient space 

### `vmstat 1 3` {1= refresh interval 1 sec, 3 = three reports}
**Output Snippet:**
```
procs -----------memory---------- ---swap-- -----io---- -system-- -------cpu-------
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st gu
 0  0      0 131700  32296 599428    0    0    14    25   46    0  0  0 100  0  0  0
 0  0      0 131700  32296 599428    0    0     0     0  243  126  0  0 100  0  0  0
 0  0      0 131700  32296 599428    0    0     0     0  174   99  0  0 100  0  1  0
```
**Observation** - No I/O wait



## 5. Network
### `sudo ss tulpn | grep cron` {ss = display socket statics(network connection)}
**Output Snippet:**
```
NO OUTPUT
```
**Observation** - cron is running locally and does not listen any port 

### `ping localhost`   or    `ping -c 5 localhost`{-c 5 = send 5 packets}
**Output Snippet:**
```
PING localhost (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.015 ms
64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.033 ms
64 bytes from localhost (127.0.0.1): icmp_seq=3 ttl=64 time=0.027 ms
^C
--- localhost ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2065ms
rtt min/avg/max/mdev = 0.015/0.025/0.033/0.007 ms
```
**Observation** - 0% oacket loss, Network is heakthy



## 6. Logs
### `journalctl -u cron -n 20`  or `journalcrl -u cron -n 20 --no-pager`
**Output Snippet:**
```
Jan 28 23:25:01 ip-172-31-7-78 CRON[15886]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
Jan 28 23:25:01 ip-172-31-7-78 CRON[15886]: pam_unix(cron:session): session closed for user root
```
**Observation** - cron jobs executing successfully 

### `tail -n 20 /var/log/auth.log | grep cron`
**Output Snippet:**
```
2026-01-28T23:35:01.526918+00:00 ip-172-31-7-78 CRON[15923]: pam_unix(cron:session): session opened for user root(uid=0) by root(uid=0)
2026-01-28T23:35:01.529680+00:00 ip-172-31-7-78 CRON[15923]: pam_unix(cron:session): session closed for user root
```
**Observation** - Seesion are opening and closing cleanly, no errors



## 7. If this worsen(Next Step)
### `systemctl restart cron && systemctl status cron`

Restart the cron service and verify post restart
