#!/bin/bash

# Get the start time in seconds
start_time=$(date +%s)

# Define the total duration in seconds
duration=300

# Run an infinite loop
while true; do
  # Get the current time in seconds
  current_time=$(date +%s)
  
  # Calculate elapsed time
  elapsed_time=$((current_time - start_time))
  
  # Print a message with elapsed time
  echo "This is a constant message. Time elapsed: $elapsed_time seconds."
  
  # Check if the duration has passed
  if [ "$elapsed_time" -ge "$duration" ]; then
    echo "300 seconds have passed."
    break
  fi
done