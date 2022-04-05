#! /bin/bash
# ! NOT operator
# -a AND
# -o OR
read -p "enter a number >= 0 AND <= 10: " NR

if [ $NR -ge 0 -a $NR -le 10 ];
then
    echo "$NR*$NR=$((NR*NR))"
else
    echo "wrong input"
fi
