#!/bin/bash

xterm -bg black -fg white -T "[Ubuntu Vivid: 64-bit]" -geometry 100x10 -e "docker run --rm -it -h vivid-x64-docker unidata/ncci:vivid-x64"&
sleep 3

xterm -bg black -fg white -T "[Ubuntu Vivid: 21-bit]" -geometry 100x10 -e "docker run --rm -it -h vivid-x86-docker unidata/ncci:vivid-x86"&
sleep 3

xterm -bg black -fg white -T "[Ubuntu Utopic: 64-bit]" -geometry 100x10 -e "docker run --rm -it -h utopic-x64-docker unidata/ncci:utopic-x64"&
sleep 3

xterm -bg black -fg white -T "[Ubuntu Trusty: 64-bit]" -geometry 100x10 -e "docker run --rm -it -h trusty-x64-docker unidata/ncci:trusty-x64"&
sleep 3

xterm -bg black -fg white -T "[Ubuntu Trusty: 32-bit]" -geometry 100x10 -e "docker run --rm -it -h trusty-x64-docker unidata/ncci:trusty-x86"&
sleep 3

xterm -bg black -fg white -T "[Fedora 21: 64-bit]" -geometry 100x10 -e "docker run --rm -it -h trusty-x64-docker unidata/ncci:fedora21-x64"&
sleep 3

xterm -bg black -fg white -T "[Centos 7: 64-bit]" -geometry 100x10 -e "docker run --rm -it -h trusty-x64-docker unidata/ncci:centos7-x64"&
sleep 3
