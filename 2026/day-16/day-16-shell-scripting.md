# Day 16 – Shell Scripting Basics
## Task 1: Your First Script
**File:** `hello.sh`
```
#!/bin/bash

echo "Hello, DevOps!"
```

**Make executable and run:**
```
chmod 744 hello.sh
./hello.sh
```

**Output**
```
Hello DevOps!
```

Without the shebang (#!/bin/bash), the script runs with the default shell (often /bin/sh), which may lack bash-specific features or cause syntax errors on non-bash systems. The shebang explicitly specifies the bash interpreter for consistent execution.

---

## Task 2: Variables
**File:** `variables.sh`
```
#!/bin/bash

NAME="FAHAD"
ROLE="DevOps Engineer"

echo "Hello, I am $NAME and I am a $ROLE"
echo 'Hello, I am $NAME and I am a $ROLE'
```
**Output**

<img width="572" height="57" alt="Screenshot 2026-02-15 at 8 45 26 PM" src="https://github.com/user-attachments/assets/208876d7-bcac-4a15-9143-64351bc5f703" />


Single quotes → literal text

Double quotes → variable expansion

Shell does not interpret variables inside single quotes.

---

## Task 3: User Input with read
```
#!/bin/bash

read -p "Enter Username: " NAME
read -p "Enter your favorite tool: " TOOL

echo "Hello $NAME, your favourite tool is $TOOL"
```

**Output**

<img width="582" height="75" alt="Screenshot 2026-02-15 at 9 20 30 PM" src="https://github.com/user-attachments/assets/03aeef3b-85ae-4db6-9fe4-285974306f42" />


---

## Task 4: If-Else Conditions
## Part. 1
```
#!/bin/bash

read -p "Enter a Number: " NUM

if [[ $NUM =~ ^-?[0-9]+$ ]]; then

        if [ $NUM -gt 0 ]; then
                echo "Number is Positive"
        elif [ $NUM -lt 0 ]; then
                echo "NUmber is Negative"
        else
                echo "Number is Zero"
        fi
else
        echo "Enter a valid Number"
fi

```

**Output**

<img width="576" height="192" alt="Screenshot 2026-02-15 at 10 54 36 PM" src="https://github.com/user-attachments/assets/23cf80b1-4396-4941-9248-093769bc538c" />


## Part. 2
### File: file_check.sh
```
#!/bin/bash

read -p "Enter file name: " FILE

if [ -f "$FILE" ]; then
        echo "File Exists"
else
        echo "File does not exist"
fi
```

**Output**

<img width="573" height="106" alt="Screenshot 2026-02-15 at 11 03 07 PM" src="https://github.com/user-attachments/assets/a478da60-3d07-4055-acd2-c5cae7fa14df" />


---

## Task 5: Combine It All
```
#!/bin/bash

SERVICE=nginx

read -p "Do you want to check the status of $SERVICE? (Y/N): " choice

#if [[ "$choice" = "Y" ]] || [[ "$choice" = "y" ]]; then
if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "Checking Status . . . "
        sudo systemctl is-active --quiet "$SERVICE"
        status=$?

        if [ $status -eq 0 ]; then
                echo "$SERVICE is active"
        elif [ $status -eq 3 ]; then
                echo "$SERVICE is not active"
        else
                echo "unknown status (code: $status)"
        fi

#elif [[ "$choice" -eq "N" ]] ||  [[ "$choice" -eq "n" ]]; then
elif [[ "$choice" =~ ^[Nn]$ ]]; then
        echo "Skipped. . ."
else
        echo "Enter valid input, eg: Y or N"
fi
```

**Output**

<img width="566" height="158" alt="Screenshot 2026-02-15 at 11 58 58 PM" src="https://github.com/user-attachments/assets/05f63aca-a41c-4c42-b20e-afff85c0eeae" />


