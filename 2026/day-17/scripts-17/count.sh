#!/bin/bash
# Method 1 for (( ... )) → Arithmetic loop
<< method
for i (( i=1; i>=10; i++ ))
do
    echo $i
done
method

# Method 2 { range 1 to 10 }
for i in {1..10}
do
    echo $i
done