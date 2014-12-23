#!/bin/bash
test -z $1 && echo "missing master file" && exit 1
target=$(./line.sh $1)
name=$(echo $target | rev | cut -d/ -f1 | rev | cut -d? -f1)
wget -q -O cache/$name $target 
ln -fs cache/$name cache/recent
