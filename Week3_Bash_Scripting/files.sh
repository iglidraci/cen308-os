#! /bin/bash

FILE="example.tar.gz"

echo "${FILE%%.*}"

echo "${FILE%.*}"

echo "${FILE#*.}"

echo "${FILE##*.}"
