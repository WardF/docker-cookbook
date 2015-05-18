#!/bin/bash

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

/usr/sbin/apache2ctl start
/etc/init.d/mysql start

echo "[Hit ENTER key to exit] or run 'docker stop <container>'"

read

echo "Stopping."
