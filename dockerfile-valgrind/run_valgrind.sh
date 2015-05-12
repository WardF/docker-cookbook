#!/bin/bash
#
if [ $# -lt 1 ]; then
    docker images
    echo ""
    echo "You must specify arguments."
    echo "Example:"
    echo "$0 [docker image] [full path to working directory]"
    echo ""
    exit 1
fi

set -x
docker run --rm -it -v $(pwd):/workdir $1
