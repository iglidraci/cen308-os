#! /bin/bash

read -p "factorial of: " NR

let fact=1

while [ $NR -ge 1 ];
do
    let fact=$((fact*NR))
    let NR=$((NR-1))
done
echo "fac=$fact"


