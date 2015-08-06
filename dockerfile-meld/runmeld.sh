#!/bin/bash

set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

if [ ! -d "/former" ]; then
    cat /root/USAGE.md
    exit 0
fi

if [ ! -d "/latter" ]; then
    cat /root/USAGE.md
    exit 0
fi

/usr/bin/meld /former /latter
