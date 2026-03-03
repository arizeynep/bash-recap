#!/usr/bin/env bash

word="$1"

reverse=""
for (( i=${#word}-1; i>=0; i-- )); do
	reverse+="${word:$i:1}"
done

echo "$reverse"

# Alternative
# reversed=$( echo "$string" | rev )
# or
# reversed=$( rev <<< "$string" )
