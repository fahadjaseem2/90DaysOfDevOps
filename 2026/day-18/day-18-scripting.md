# Day 18 – Shell Scripting: Functions & Slightly Advanced Concepts
## Task 1: Basic Functions
### function.sh
The functions.sh script contains two functions: greet() and add(). The greet() function takes a name as an argument when it is called, and the add() function adds two numbers.

[script: function.sh](scripts/function.sh)

**Output**

<img width="568" height="44" alt="Screenshot 2026-02-18 at 2 38 31 AM" src="https://github.com/user-attachments/assets/da246089-f439-499e-94cf-3966c4e4b4ba" />


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

<img width="570" height="142" alt="Screenshot 2026-02-18 at 2 51 37 AM" src="https://github.com/user-attachments/assets/e1468821-482b-47c8-894e-2e45c949fe9a" />


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

<img width="835" height="91" alt="Screenshot 2026-02-18 at 8 29 08 PM" src="https://github.com/user-attachments/assets/e6031499-c94e-4403-b15e-97a075f3609c" />


---

## ask 5: Build a Script — System Info Reporter

[scripts: system_info.sh](scripts/system_info.sh)

**Output**

<img width="825" height="271" alt="Screenshot 2026-02-18 at 8 37 05 PM" src="https://github.com/user-attachments/assets/31207979-cd34-4a56-b58c-9ec6592d35b7" />




