#!/bin/bash
set -euo pipefail

print_header() {
    echo "=================================="
    echo "$1"
    echo "=================================="
}

print_system_info() {
    print_header "System Information"
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -a)"
}

print_uptime() {
    print_header "Uptime"
    uptime
}

print_disk_usage() {
    print_header "Top 5 Disk Usage"
    du -h / 2>/dev/null | sort -rh | head -5
}

print_memory() {
    print_header "Memory Usage"
    free -h
}

print_cpu_processes() {
    print_header "Top 5 CPU Processes"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
}

main() {
    print_system_info
    print_uptime
    print_disk_usage
    print_memory
    print_cpu_processes
}

main
