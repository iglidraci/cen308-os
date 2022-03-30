#! /bin/bash

echo "name of the script $0"
echo "argument 1 is $1"
echo "there are $# number of arguments: $@"

# loop over every .txt file in the directory and rename it to .txt2

for file in *.txt; do
    mv $file ${file}2
done
