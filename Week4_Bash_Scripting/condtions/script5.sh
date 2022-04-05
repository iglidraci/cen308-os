#! /bin/bash
if [ $# -eq 1 ];
then
    if [ ! -d "trash" ];
    then
        mkdir "trash"
    fi
    cp $1 trash
else
    echo "use: $0 filename"
    exit 1
fi
