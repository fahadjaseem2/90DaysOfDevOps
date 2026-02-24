# Day 20 – Log Analyzer and Report Generator

## Script Name

[Script: log_analyzer](scripts/log_analyzer.sh) 

## What the Script Does

This script analyzes a log file and generates a summary report.

Features:

- Validates input file
- Counts ERROR and Failed events
- Finds CRITICAL events with line numbers
- Shows top 5 error messages
- Generates summary report
- Archives processed log file

---

## Commands Used

grep  
→ Search patterns in file  

awk  
→ Process and clean log text  

sort  
→ Sort messages  

uniq -c  
→ Count occurrences  

wc -l  
→ Count lines  

date  
→ Generate report filename  

mv  
→ Archive processed logs  

mkdir  
→ Create archive directory  

---

## Sample Output

