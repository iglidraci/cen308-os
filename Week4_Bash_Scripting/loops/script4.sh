#! /bin/bash

let cnt=10

until [ $cnt -eq 0 ];
do
    echo $cnt
    let cnt=$((cnt-1))
    sleep 1
done

