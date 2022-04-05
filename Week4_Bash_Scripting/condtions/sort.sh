#!/bin/bash


if [[ $# -le 0 ]]
then
    echo "usage: $0 arg1 arg2 ..."
    exit 1
fi

count=1

for arg in "$@"
do
    n[$count]=${arg}
    let "count += 1"
done

echo "n=${n[@]}"

echo "before sorting"
printf "%s\n" "${n[@]}"
echo "after sorting"
sort -n <(printf "%s\n" "${n[@]}")
