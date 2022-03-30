#! /bin/bash
clear
rm *.txt
ls -l
echo "this is a simple script"
echo "right now you are inside `pwd` directory"
echo "today's date is `date`"

echo "these users are currently connected:"
w -h | sort
echo

echo "this is `uname -s` on a `uname -m` processor."
echo

echo "this is the uptime information"
uptime
echo "that's all folks!"

