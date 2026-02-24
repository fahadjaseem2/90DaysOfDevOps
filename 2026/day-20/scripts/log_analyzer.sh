#!/bin/bash

display_usage="Usage: $0 <log_file>"

check_usage() {
    if [ $# -ne 1 ]; then
        echo "$display_usage"
        exit 1
    fi
}

check_usage "$@"

log_file="$1"

check_file_exist() {
    if [ ! -f "${log_file}" ]; then
        echo "Log File is missing"
        exit
    fi
}

check_file_exist "$@"

echo "Starting analysis of: $log_file" 
#Count the total number of lines containing the keyword ERROR or Failed

total_errors=$(grep -Ei "ERROR|FAILED" "$log_file" | wc -l) #-E means Extended Regular Expressions for "Error|Failed"
echo "Total Error/Failed founds: $total_errors"

#Search for lines containing the keyword CRITICAL and print with their line number

total_critical=$(grep -in "critical" "$log_file")  # -n use for print line number
if [ -z $total_critical ]; then
    echo "No critical events found"
else
    echo "$total_critical"
fi



<< comment
awk = This removes fields 1, 2, and 3 (date, time, ERROR keyword), which leaves leading spaces. substr($0,4) removes those leading spaces so only the actual error message remains.
sort = sort alphabetically
uniq -c = counts how many times each message appears.
sort -rn = -r reverse the order and sort highest first and -n numeric sort
comment

top_error=$(grep -i "error" $log_file \
| awk '{$1=$2=$3=""; print substr($0,4)}' \
| sort \
| uniq -c \
| sort -rn \
| head -n 5)

#echo "$top_error"

# Task 5: Summary Report
{
echo "--------------------------"
echo "***** Summary Report *****"
echo "--------------------------"
echo "Date of Analysis: $(date '+%Y-%m-%d')"
echo 
echo "Log File Name: $1"
echo 
echo "Total Line Processed: $(wc -l < $log_file) " # < input redirection
echo 
echo "Total error count: $total_errors"
echo
echo "-----------------------------"
echo "--- Top 5 Error Messages ---"
echo "-----------------------------"
echo "Top five error with their occurance: $top_error"
echo
echo "--- Critical Events ---"
if [ -z "$CRITICAL_EVENTS" ]; then
echo "No critical events found."
else
echo "$CRITICAL_EVENTS"
fi

} > log_report_$(date '+%Y-%m-%d').txt

# Task 6: Archive Processed Logs
archive_dir=archive
echo "Creating Archive directory"
if [ ! -d "$archive_dir" ]; then
    mkdir "$archive_dir"
fi

mv "$log_file" "$archive_dir"
echo "Log file moved to archive/ directory."


