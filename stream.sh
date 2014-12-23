#!/bin/bash
test -z $1 && echo "missing master file" && exit 1
target=$2
test -z $2 && echo "missing video file, using default" && target="cache/merged.ts"
mkdir cache
while :
do
    t=$(date --utc +%s)
    name=$(./get.sh $1)
    length=$(./length.sh $(readlink cache/recent) )
    echo "streaming $t"
    cat $(readlink cache/recent) >> $target
    ./wait.sh $length $t
done
