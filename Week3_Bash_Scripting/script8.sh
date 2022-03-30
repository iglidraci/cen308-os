#!/bin/bash

# write a script that creates directories named hw1, hw2 ... up to a maximum passed as a command line arg
# copy requirements.txt into each assignment i as requirements(2*i).txt
# copy script1.sh into each and run it
# output: script running on hw3 with requirements6.txt

# command seq -> outputs a sequence of numbers
# for i in `seq 10`; do

for i in `seq $1`; do
    mkdir "hw$i"
    let res="2 * $i"
    cp requirements.txt "hw$i/requirements$res.txt"
    cp test.sh "hw$i/"
    cd "hw$i/"
    echo "script running on hw$i with requirements$res.txt ..."
    chmod +x test.sh
    bash ./test.sh
    cd ..
done
