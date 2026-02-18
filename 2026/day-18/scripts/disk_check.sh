#!/bin/bash

check_disk() {
        echo "Checking disk Usage ..."
        df -h / #root
}
check_memory() {
        echo "Checking memory usage ..."
        free -h
}

main() {
        echo "Starting system health check ..."
        check_disk
        echo
        check_memory
}
main
