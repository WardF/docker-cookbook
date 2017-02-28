#!/bin/bash

trap "echo TRAPed signal" HUP INT QUIT KILL TERM


if [ "x$HELP" != "x" ]; then
    cat README.md
    exit 0
fi

###
# Set up timezone
###
echo America/Denver > /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

/usr/sbin/apache2ctl start
/etc/init.d/mysql start

echo "[Hit ENTER key to exit] or run 'docker stop <container>'"

read

echo "Stopping."
