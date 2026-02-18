# Day 18 – Shell Scripting: Functions & Slightly Advanced Concepts
## Task 1: Basic Functions
### function.sh
The functions.sh script contains two functions: greet() and add(). The greet() function takes a name as an argument when it is called, and the add() function adds two numbers.

[script: function.sh](scripts/function.sh)

**Output**

screenshot

---

## Task 2: Functions with Return Values
### disk_check.sh
It has two functions:
check_disk()

This function shows disk usage of the root (/) directory using df -h

check_memory()

This function shows memory usage using free -h

The main() function starts the health check

It prints a message, then calls check_disk(), and then calls check_memory().

**Output**

screenshot

---

## Task 3: Strict Mode — set -euo pipefail

script

`set -e`: (Exit on error) The script stops immediately if any command returns a non-zero exit code.

`set -u`: (Unset variables) The script exits if you try to use a variable that hasn't been defined. Great for catching typos!

`set -o` pipefail: Normally, a pipe only cares if the last command succeeds. This flag ensures that if any command in a pipeline fails, the whole pipeline is considered failed.

**Output**

screenshot

---

## Task 4: Local Variables

[script: local_demo.sh](scripts/local_demo.sh)

**Output**

screenshot

---

## ask 5: Build a Script — System Info Reporter

[scripts: system_info.sh](scripts/system_info.sh)

**Output**

screenshot
