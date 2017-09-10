#!/bin/bash

usage() {
	echo "Generates .csv files of results of EDC marks for various assignments"
	echo "These .csv files can then be used to create distribution graphs"
	echo
	echo "Usage: $(basename "$0") [OPTIONS]"
	echo
	echo -e "\t-h\tdisplay this help and exit (success)"
	echo -e "\t-t\ttarget assignment number"
	echo -e "\tanything else: display this help and exit (fail)"
}

# Default values
prefix="assign"

# Find highest number assignment, since it's most
# likely to be used with this script
for item in $(ls -r -d -- "$prefix"*) ;do
	assign="$item"
	break
done

# Parse arguments
while getopts 'a:h' opt ;do
	case $opt in
		a)
			assign="$prefix${OPTARG}"
			;;
		h)
			usage
			exit 0
			;;
		*)
			usage
			exit 1
			;;
	esac
done

if [ ! -d "$assign" ] ;then
	echo "Error, the requested directory does not exist, aborting"
	exit 1
fi

make || exit 0

for item in "$assign/"results*.txt ;do
	outname=${item%.*}
	grep "tests" "$item" | $(./a "$outname")
done
