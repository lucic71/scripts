import sys

# Given the following diff:
# - a
# + b
# ...
# - c
# + d
# + e
# This returns the second chunk as it was different number of deletions
# and additions.

lines = sys.stdin.readlines()
chunk = []
for line in lines:
    if line.startswith(' '):
        if len(chunk) > 0:
            deletions = sum(1 for l in chunk if l.startswith('-'))
            additions = sum(1 for l in chunk if l.startswith('+'))
            if deletions != additions:
                sys.stdout.write(''.join(chunk))
                print("")
            chunk = []
    else:
        if "IR Dump" in line:
            sys.stdout.write(line[1:])
            if "***1" in line:
                print("")
        else:
            chunk.append(line)
