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

echo ""
echo "Restarting php5-fpm"
service php5-fpm restart
sleep 1
echo "Starting nginx"
service nginx start
echo ""
sleep 1
echo "Webserver running. Press [RETURN] to exit."
read
