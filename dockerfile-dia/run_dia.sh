#!/bin/bash
#
# Convienence script to launch a docker container version of dia with all of the appropriate arguments.

if [ $# -lt 1 ]; then
    docker images
    echo ""
    echo "You must specify a docker image."
    exit 1
fi

set -x
#docker run -p 5901:5901 -v $(pwd):/home/dockuser/diagrams $1
docker run --rm -e DISPLAY=192.168.59.103:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/dockuser/.Xauthority --net=host -v $(pwd):/home/dockuser/diagrams test-dia
