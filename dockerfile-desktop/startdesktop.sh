#!/bin/bash
#
# Script that starts the docker image desktop
# session. Not for internal use.
#

set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

if [ "x${USEPASS}" == "x" ]; then
    cp /home/${CUSER}/.xinitrc.nopassword /home/${CUSER}/.xinitrc
else
    mkdir -p /home/${CUSER}/.vnc
    cp /home/${CUSER}/.xinitrc.password /home/${CUSER}/.xinitrc
    x11vnc -storepasswd "${USEPASS}" /home/${CUSER}/.vnc/passwd
fi

xinit -- /usr/bin/Xvfb :1 -screen 0 $SIZEW\x$SIZEH\x$CDEPTH &
sleep 5

export DISPLAY=localhost:1

if [ "x${USENOVNC}" == "xTRUE" ]; then
    mv /home/${CUSER}/docs/self_unsigned.pem /home/${CUSER}/noVNC/utils/self.pem
    /home/${CUSER}/noVNC/utils/launch.sh --vnc 127.0.0.1:5901 &
fi

echo "Press [return] to exit."
read
