#!/bin/bash
test -z $1 && echo "missing media file" && exit 1
mediainfo --Inform="General;%Duration%" $1
