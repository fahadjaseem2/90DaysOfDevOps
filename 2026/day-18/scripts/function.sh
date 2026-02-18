#!/bin/bash

greet() {
        echo "Hello $1"
}

add() {
        num1=$1
        num2=$2
        sum=$((num1 + num2))
        echo "The sum of $num1 and $num2 is: $sum"
}

#calling function
greet "fahad"
add 10 6