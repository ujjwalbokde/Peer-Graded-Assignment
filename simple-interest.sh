#!/bin/bash

# simple-interest.sh - A script to calculate simple interest

# Function to display usage information
usage() {
    echo "Usage: $0 <principal> <rate> <time>"
    echo "  principal : The principal amount (initial investment) - positive number"
    echo "  rate      : The annual interest rate (in percentage) - positive number"
    echo "  time      : The time period (in years) - positive number"
    exit 1
}

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    usage
fi

# Read input arguments
principal=$1
rate=$2
time=$3

# Validate input: check if all arguments are positive numbers
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: All arguments must be positive numeric values."
    usage
fi

# Validate if the arguments are positive numbers
if [ "$(echo "$principal <= 0" | bc)" -eq 1 ] || [ "$(echo "$rate <= 0" | bc)" -eq 1 ] || [ "$(echo "$time <= 0" | bc)" -eq 1 ]; then
    echo "Error: All arguments must be positive numbers greater than zero."
    usage
fi

# Calculate simple interest
simple_interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Display the result
echo "Principal Amount: $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $simple_interest"
