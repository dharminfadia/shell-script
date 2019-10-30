#!/bin/bash

# Reading parameters
PARAM0=$1
PARAM1=$2

echo "args - $PARAM0"
echo "args - $PARAM1"

# File location
INPUT_FILE='./input.txt'

# Declare a hashmap to store the input mapping
declare -A INPUT_MAP

# Read & iterate through every line
while IFS= read -r line
do
    declare -a eachline=( $( echo $line | cut -d' ' -f1- ) )
    KEY=${eachline[0]}
    VALUE=${eachline[1]}
    INPUT_MAP[$KEY]=$VALUE
done < "$INPUT_FILE"

# Mapped values
echo "Mapped key - 0: ${INPUT_MAP[$PARAM0]}"
echo "Mapped key - 1: ${INPUT_MAP[$PARAM1]}"
