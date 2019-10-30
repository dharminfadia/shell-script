#!/bin/bash

# Validating the parameters
if [ -z "$1" ]
then
    echo "Please provide first parameter"
    exit
fi

if [ -z "$2" ]
then
    echo "Please provide second parameter"
    exit
fi

# Reading parameters
PARAM1=$1
PARAM2=$2

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

# Check if give values exists in the file or not
if [[ -v "INPUT_MAP[$PARAM1]" ]] ; then
    if [[ -v "INPUT_MAP[$PARAM2]" ]] ; then
        #
        # Example:
        #
        # VALUE1=INPUT_MAP[$PARAM1]
        # VALUE2=INPUT_MAP[$PARAM2]
        #
        #
        echo "Values are present the file"
        echo ${INPUT_MAP[$PARAM1]}
        echo ${INPUT_MAP[$PARAM2]}
    else
        echo "Invalid valid for second argument i.e., $PARAM2"
    fi
else
    echo "Invalid valid for first argument i.e., $PARAM1"
fi

# use VALUE1 and VALUE2 here