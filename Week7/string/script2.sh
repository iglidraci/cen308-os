#!/bin/bash
str=abcdefg
for i in $(seq 0 $((${#str}-1))); do
  echo ${str:${i}}
done

for i in $(seq 0 $((${#str}-1))); do
  echo ${str:0:${#str}-i}
done