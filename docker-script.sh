#!/bin/bash

 docker container run --rm -it -u $(id -u ${USER}):$(id -g ${USER}) --name MozLz4-decompress -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e PYTHONDONTWRITEBYTECODE=1 python:3.10-slim /bin/bash -l -c 'pip3.10 install --no-cache-dir lz4 && python /usr/src/myapp/mozlz4.py -d $1 bookmarksRaw.json'