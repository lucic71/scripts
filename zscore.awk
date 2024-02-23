#!/bin/awk -f

# Function to calculate the z-score
function zscore(x, avg, sd) {
    return (x - avg) / sd
}

# Main AWK script
BEGIN {
    if (ARGC != 4) {
        print "Usage: awk -f zscore.awk mean stddev datafile"
        exit 1
    }

    mean = ARGV[1]
    sd = ARGV[2]

    print "Mean: " mean ", sd: " sd

    # Process the datafile
    while ((getline < ARGV[3]) > 0) {
        z = zscore($1, mean, sd)
        printf "Data Point: %.2f, Z-Score: %.2f\n", $1, z
    }

    close(ARGV[3])
}
