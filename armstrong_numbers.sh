#!/usr/bin/env bash

number="$1"
digits=()
index=0
while (( number > 9 )); do
	digits[${index}]=$(( number%10 ));
	number=$(( number/10 ));
	(( index++ ))
done

digits[${index}]="${number}"
(( index++ ))

sum=0
for i in "${digits[@]}"; do
	sum=$(( sum+i**index ))
done

is_armstrong="false"
if [[ "${sum}" -eq "$1" ]]; then
	is_armstrong="true"
fi

echo "${is_armstrong}"

