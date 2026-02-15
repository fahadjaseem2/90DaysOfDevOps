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
Output

Screenshot

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

Output

screenshot

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

Output

screenshot

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

Output

Screenshot

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

Output

screenhsot

