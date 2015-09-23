#!/bin/bash

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

echo "Running linkchecker-gui"
/usr/bin/linkchecker-gui
