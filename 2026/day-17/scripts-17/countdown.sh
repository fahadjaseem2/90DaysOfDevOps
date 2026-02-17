#!/bin/bash

read -p "Enter a Number: " number

#validate number (only Integer)
if [[ ! $number =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Enter a valid number"
        exit 1
fi

if (( number >= 0 )); then

        while (( number >= 0 ))
        do
                echo $number
                (( number-- ))
        done
else
        while (( number <=0 ))
        do
                echo $number
                (( number++ ))
        done
fi

echo "DONE!"