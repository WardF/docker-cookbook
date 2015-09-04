#!/bin/bash

xterm -bg black -fg white -T "[Ubuntu Vivid: 64-bit]" -e "docker build -t unidata/ncci:vivid-x64 -f Dockerfile.vivid.x64 ." &
sleep 1

xterm -bg black -fg white -T "[Ubuntu Utopic: 64-bit]" -e "docker build -t unidata/ncci:utopic-x64 -f Dockerfile.utopic.x64 ." &
sleep 1
