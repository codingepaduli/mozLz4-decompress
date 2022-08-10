#!/bin/bash

if [$# -ne 1]; 
    then echo "illegal number of parameters"
    exit 1
fi

# decompress and pretty print the bookmarks.json
python3 "mozlz4.py" -d $1 "bookmarksRaw.json"
