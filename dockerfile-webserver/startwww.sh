#!/bin/bash
#
#

set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

if [ "x$HELP" != "x" ]; then
    cat README.md
    exit
fi

if [ ! -d /www ]; then
    echo "Missing /www directory."
    cat README.md
    exit
fi

service nginx start

echo "Webserver running. Press [RETURN] to exit."
read
