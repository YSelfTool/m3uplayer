#!/bin/bash
test -z $1 && echo "missing master file" && exit 1
target=$(curl -silent $(cat $1 | tail -n 1) | tail -n 1)
echo $target
