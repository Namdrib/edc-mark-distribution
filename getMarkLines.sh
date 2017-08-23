#!/bin/bash

make || exit 0

for item in results*.txt ;do
	echo "Testing $item"
	grep "tests" "$item" | $(./a "$item")
done
