#!/usr/bin/env python3

import sys

# Initialize variables to store the previous and current diff sections
prev_diff = None
current_diff = []

# Loop through each line in the input text
for line in sys.stdin:
    line = line.strip()  # Remove leading/trailing whitespace
    # If the line contains "IR Dump", it indicates the start of a new diff section
    if "IR Dump" in line:
        print(line)
        # If the previous diff section is not None and it's different from the current one
        if prev_diff is not None and prev_diff != current_diff:
            # Print the previous diff section
            print('\n'.join(prev_diff))
        elif prev_diff is None:
            print('\n'.join(current_diff))
        # Update the previous diff section with the current one
        prev_diff = current_diff.copy()
        # Clear the current diff section for the next iteration
        current_diff = []
    else:
        # Append the line to the current diff section
        current_diff.append(line)

# Print the last diff section if it's not None and different from the previous one
if prev_diff is not None and prev_diff != current_diff:
    print('\n'.join(current_diff))
