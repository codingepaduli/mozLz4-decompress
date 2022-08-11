# MozLz4-decompress

Decompression utility for Mozilla FireFox bookmarks file, that is a JSON file compressed with the Mozilla's "mozLz4" format (.jsonlz4).

Note from internet: The mozLz4 format is just plain LZ4 data with a custom header (magic number [8 bytes] and uncompressed file size [4 bytes, little endian]).

### Prerequisites

You need python3 and the [LZ4 library python3-lz4](https://pypi.python.org/pypi/lz4).

## Usage

Run as python script as the following:

```
python3 mozlz4.py -d path/to/bookmark.jsonlz4 bookmarksRaw.json
```

To run in docker, create the folder ``.local`` and execute docker as the following:

```bash
docker container run --rm -it -u $(id -u ${USER}):$(id -g ${USER}) --name MozLz4-decompress \
    -v "$PWD":/usr/src/myapp -v "$PWD/.local":"/.local" -w /usr/src/myapp \
    --entrypoint "" -e PYTHONDONTWRITEBYTECODE=1 python:3.10-slim /bin/bash  \
    -l -c 'pip install --no-cache-dir lz4 && python /usr/src/myapp/mozlz4.py -d path/to/bookmark.jsonlz4 bookmarksRaw.json'
```

You can get an example in the file ``docker-script.sh``.

## License

MIT License. Read the file LICENSE

