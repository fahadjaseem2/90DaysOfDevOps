# 1 Core Component of Linux
## Kernal 

The **Kernal** is the heart of the linux.Its directly intracts with hardware and manages system resources.

### Key responsibilities -
- CPU Scheduling(which process runs when)
- Memory management(RAM allocation)
- Process management
- device drivers
- File systems
- Networking

Application never talk to hardware directly, they go through the **Kernal**.

## User Space
User space is where Application and Users live.

### Includes -
- Shell(Bash, zsh)
- System utilities(ls,ps,top)
- Services(ssh)
- User Application

User space programs request services from the Kernal using system calls.

## init system(systemd)
The init system is the first **user-space** process started by the **Kernal**.
- Historically: init
- Modern Linux: systemd

**PID 1 => systemd**
systemd is responsible for bringing the system to a usable state.


# 2 How Processes Are Created and Managed
### 1. A process is creating using:
- fork() - Creates a copy of process 
- exec() - Replace it with new program

### 2. Every process has:
- PID - process ID
- PPID - parent process ID
- State(running,sleeping,stop,zombie,orphan)

### 3 The kernel manages:
- CPU time
- Memory usage
- Process Isolation
- Signals (kill,stop,restart)


# What systemd does and why it matters
systemd is service manager and system controller.

### what it does:
- Start service at boot
- Stops, Restart and monitors service
- Manage dependencies
- Handles Logging

### why is matters in DevOps:
- Service failure -> systemd tells you why
- Restart policies -> auto recovery
- Dependency management -> clean boot order
- Essential for troubleshooting production systems
