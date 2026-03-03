#!/usr/bin/env bash

# - Symbol # is used to get the length of the word.
# - The following parameter expansion was used in the "for" loop: ${var:offset:length}, 
# which returns a sub-string starting at offset with the specified length.

word="$1"

reversed=""
for (( i=${#word}-1; i>=0; i-- )); do
	reversed+="${word:$i:1}"
done

echo "$reversed"

# Alternative
# reversed=$( echo "$string" | rev )
# or
# reversed=$( rev <<< "$string" )
