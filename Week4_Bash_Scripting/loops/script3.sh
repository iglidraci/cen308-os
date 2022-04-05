#! /bin/bash

if [ $# -lt 1 ];
then
    echo "usage: $0 arg1 arg2 arg3 ..."
    exit 1
else
    while [ $# -gt 0 ];
    do
        mkdir $1
        shift
    done
fi
