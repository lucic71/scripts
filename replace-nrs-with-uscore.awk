#!/usr/bin/awk -f

{
    for (i = 1; i <= NF; i++) {
        # Using a regex to identify words starting with '%' followed by optional letters and numbers
        if ($i ~ /^%([[:alpha:]]|[0-9])/) {
            gsub(/[0-9]/, "_", $i) # Replace numbers with underscore
	    gsub(/_+/, "_", $i)      # Collapse multiple underscores into a single one
        }
    }
    print $0
}

