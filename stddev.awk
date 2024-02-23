#!/bin/awk -f

# Function to compute the mean of an array
function mean(arr, len) {
    sum = 0
    for (i = 1; i <= len; i++) {
        sum += arr[i]
    }
    return sum / len
}

# Function to compute the standard deviation of an array
function stddev(arr, len, avg) {
    sum = 0
    for (i = 1; i <= len; i++) {
        sum += (arr[i] - avg)^2
    }
    return sqrt(sum / len)
}

# Main AWK script
{
    numbers[NR] = $1
}

END {
    # Calculate mean
    avg = mean(numbers, NR)

    # Calculate standard deviation
    sd = stddev(numbers, NR, avg)

    # Print the result
    printf "Mean: %.2f\n", avg
    printf "Standard Deviation: %.2f\n", sd
}
