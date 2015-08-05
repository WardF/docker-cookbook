#!/bin/bash

if [ ! -d "/former" ]; then
    cat /root/USAGE.md
    exit 0
fi

if [ ! -d "/latter" ]; then
    cat /root/USAGE.md
    exit 0
fi

/usr/bin/meld /former /latter
