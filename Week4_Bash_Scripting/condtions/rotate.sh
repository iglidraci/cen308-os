#!/bin/bash

if [ ! $# -eq 1 ];
then
    echo "usage: $0 logfile"
    exit 1
fi

f=$1

if [ ! -f $f ]
then
  echo $f is not a file
  exit
fi

touch ${f}
MAXSIZE=$((4096*1024))
FILESIZE=$(stat -f%z "$f")


if [ ${FILESIZE} -gt ${MAXSIZE} ]
then
    echo Rotating!
    timestamp=`date +%s`
    mv ${f} ${f}.$timestamp
    touch ${f}
fi


