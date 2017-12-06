#!/bin/bash
# https://www.reddit.com/r/ScriptSwap/comments/7h53t2/artist_name_script/

dir="$HOME/test"
file="$HOME/output.txt"

if [ -f $file ]; then
    rm $file
fi

ls $dir | cut -d "-" -f1 >> $file
cat $file
