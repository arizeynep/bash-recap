#!/usr/bin/env bash

declare -a power_list

allergies=(
    [1]="eggs"
    [2]="peanuts"
    [4]="shellfish"
    [8]="strawberries"
    [16]="tomatoes"
    [32]="chocolate"
    [64]="pollen"
    [128]="cats"
)

allergy_score="$1"
key_word="$2"
allergy="$3"

index=0
while (( allergy_score > 0 )); do
	power_list[index]=$(( allergy_score & -allergy_score ))
	allergy_score=$(( allergy_score - power_list[index] )) 
	(( index++ ));
done

result="false"
output=()
for i in "${power_list[@]}"; do
	if (( i <= 128 )); then
		if [[ "${key_word}" == "allergic_to" ]]; then
			if [[ "${allergies[$i]}" == "${allergy}" ]]; then
				result="true"
			fi
		elif [[ "${key_word}" == "list" ]]; then
			output+=("${allergies[$i]}")
		fi
	fi
done

if [[ "${key_word}" == "allergic_to" ]]; then
	echo "${result}"
elif [[ "${key_word}" == "list" ]]; then
	echo "${output[@]}"
fi


