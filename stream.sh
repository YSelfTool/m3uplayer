#!/bin/bash
test -z $1 && echo "missing master file" && exit 1
target=$2
test -z $2 && echo "missing video file, using default" && target="cache/merged.ts"
mkdir cache
while :
do
    t=$(date --utc +%s)
    old=$(readlink cache/recent)
    name=$(./get.sh $1)
    new=$(readlink cache/recent)
    length=$(./length.sh $new)
    echo "streaming $t"
    if [ $old != $new ]; then
        cat $(readlink cache/recent) >> $target
    fi
    ./wait.sh $length $t
done
