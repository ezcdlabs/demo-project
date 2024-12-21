#!/bin/bash

# Take input for the lower and upper limits of the seconds from arguments or environment variables
lower_limit=${1:-${LOWER_LIMIT:-31}}
upper_limit=${2:-${UPPER_LIMIT:-100}}

# Generate a random number between the lower and upper limits
random_number=$((RANDOM % (upper_limit - lower_limit + 1) + lower_limit))

# Generate a random number between 1 and 10
# Take input for the percentage failure from arguments or environment variables
failure_percentage=${3:-${FAILURE_PERCENTAGE:-10}}

# Generate a random number between 1 and 100
failure_chance=$((RANDOM % 100 + 1))

echo "Duration: $random_number"
if [ $failure_chance -le $failure_percentage ]; then
    echo "Simulation will fail"
else
    echo "Simulation will pass"

fi

# Sleep for the random number of seconds
for ((i=$random_number; i>0; i--)); do
    echo "Sleeping for $i seconds..."
    sleep 1
done

# Emit a failure if the random number is less than or equal to the failure percentage
if [ $failure_chance -le $failure_percentage ]; then
    echo "Simulation failed"
    exit 1
fi

echo "Simulation succeeded"
exit 0