#!/bin/bash

set -euo pipefail

echo "Testing set -u (undefined variables)"

#echo "$Undefined_var"

echo "Testing set -e (Command failure)"

#ls /notavail/nonedir

echo "Testing set -o pipefail"
