#!/usr/bin/env bash

dirlist=$(find $1 -mindepth 1 -maxdepth 1 -type d)

for dir in $dirlist
do
    (
    cd $dir
    echo "----"
    echo $dir
    git pull --prune --autostash
    )
done
