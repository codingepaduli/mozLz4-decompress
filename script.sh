#!/bin/bash

# This script decompress the bookmarks.jsonl4 into bookmarks.json

if [ $# -ne 2 ]; then 
    echo "This script decompress the bookmarks.jsonl4 into bookmarks.json"
    echo "Syntax:"
    echo "    ./script.sh path/to/bookmark.jsonlz4 path/to/bookmarks.json"
    exit 1
fi

# Current directory
currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

python3 "$currentDir/mozlz4.py" -d $1 $2
