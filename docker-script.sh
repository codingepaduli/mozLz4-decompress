#!/bin/bash

# This script decompress the bookmarks.jsonl4 into bookmarks.json

if [ $# -ne 2 ]; then 
    echo "This script decompress the bookmarks.jsonl4 into bookmarks.json"
    echo "Syntax:"
    echo "    ./docker-script.sh path/to/bookmark.jsonlz4 path/to/bookmarks.json"
    exit 1
fi

# Current directory
currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bookmarksFolder="$( cd "$( dirname "$1" )" && pwd )"

bookmarksFile=`basename $1`

docker container run --rm -it -u $(id -u ${USER}):$(id -g ${USER}) --name MozLz4-decompress -v "$PWD":/usr/src/myapp -v "$PWD/.local":"/.local" -v "$bookmarksFolder":/usr/src/bookmarksFolder -w /usr/src/myapp -e PYTHONDONTWRITEBYTECODE=1 python:3.10-slim /bin/bash -l -c "pip install --no-cache-dir lz4 && python /usr/src/myapp/mozlz4.py -d /usr/src/bookmarksFolder/$bookmarksFile $2"
