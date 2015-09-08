#!/bin/bash

xterm -bg black -fg white -T "[Ubuntu Vivid: 64-bit]" -e "docker build -t unidata/ncci:vivid-x64 -f Dockerfile.vivid.x64 ." &
sleep 3

xterm -bg black -fg white -T "[Ubuntu Vivid: 32-bit]" -e "docker build -t unidata/ncci:vivid-x86 -f Dockerfile.vivid.x86 ." &
sleep 3

xterm -bg black -fg white -T "[Ubuntu Utopic: 64-bit]" -e "docker build -t unidata/ncci:utopic-x64 -f Dockerfile.utopic.x64 ." &
sleep 3

xterm -bg black -fg white -T "[Ubuntu Trusty: 64-bit]" -e "docker build -t unidata/ncci:trusty-x64 -f Dockerfile.utopic.x64 ." &
sleep 3

xterm -bg black -fg white -T "[Fedora 21: 64-bit]" -e "docker build -t unidata/ncci:fedora21-x64 -f Dockerfile.fedora21.x64 . " &
sleep 3

xterm -bg black -fg white -T "[Centos 7: 64-bit]" -e "docker build -t unidata/ncci:centos7-x64 -f Dockerfile.centos7.x64 . " &
sleep 3


echo "[Finished]"
