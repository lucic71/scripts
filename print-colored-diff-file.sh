awk '
	/^-/ {print "\033[31m" $0 "\033[0m"; next}
	/^\+/ {print "\033[32m" $0 "\033[0m"; next}
	{print}
' $@
