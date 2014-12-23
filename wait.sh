#!/bin/bash
test -z $1 && echo "missing length" && exit 1
test -z $2 && echo "missing start" && exit 2
length=$(($(echo $1 | cut -f1 -d.) / 1000))
end=$(date --utc +%s)
duration=$(($end - $2))
sleep $(($length - $duration))
