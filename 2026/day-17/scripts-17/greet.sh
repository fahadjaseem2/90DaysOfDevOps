#!/bin/bash

echo "Number of arguments: $#"

if [ $# -eq 0 ]; then
        echo "Usage: ./greet.sh"
else
        echo "hello $1"
fi