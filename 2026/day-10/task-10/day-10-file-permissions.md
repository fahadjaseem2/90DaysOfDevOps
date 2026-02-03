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

<img width="577" height="91" alt="Screenshot 2026-02-03 at 4 30 36 PM" src="https://github.com/user-attachments/assets/52db2d8b-8cf6-4bd5-9d3d-232a4a589645" />


**After**

<img width="569" height="80" alt="Screenshot 2026-02-03 at 4 36 00 PM" src="https://github.com/user-attachments/assets/ab00ca76-3cbe-4d5d-80c2-6fd76b3131dd" />


- project/ 

Permissions: 755 (rwxr-xr-x)

<img width="511" height="21" alt="Screenshot 2026-02-03 at 4 39 26 PM" src="https://github.com/user-attachments/assets/c0c468b4-6418-4e38-b68e-a0ceb0acf230" />


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
