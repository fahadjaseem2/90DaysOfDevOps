# Day 10 – File Permissions & File Operations Challenge
## File Created
- devops.txt
- notes.txt
- script.sh
- project/

## Permission Changes
- devops.txt
- notes.txt
- script.sh

**before**

Screenshot

**After**

screenshot

- project/ 

Permissions: 755 (rwxr-xr-x)

screenshot 


## Command used
```
- touch devops.txt
- echo "This is my day 10 task submission" > notes.txt
-  vim script.sh
- chmod 766 script.sh
- chmod 444 devops.txt
- chmod 640 notes.txt
- mkdir project
- chmod 755 project
- ls -l
- head /etc/passwd
- tail /etc/passwd
```


## What I Learned
- How Linux permissions control file access
- Difference between read, write, and execute permissions
- How numeric permissions map to rwx values