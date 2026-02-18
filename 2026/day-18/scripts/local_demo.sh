#!/bin/bash

global_var="I am Global"

test_local() {
    local local_var="I am Local"
    global_var="I have been changed!"
    echo "Inside function: $local_var"
    echo "Inside function: $global_var"
}

test_local

echo "Outside function: $global_var"
echo "Outside function: $local_var" # This will be empty because it was local!