#!/bin/bash
#
# Script that starts the docker image desktop
# session. Not for internal use.
#

set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

xinit -- /usr/bin/Xvfb :1 -screen 0 $SIZEH\x$SIZEW\x$CDEPTH &
sleep 5

export DISPLAY=localhost:1

if [ "x${USENOVNC}" == "xTRUE" ]; then
    mv /home/${CUSER}/docs/self_unsigned.pem /home/${CUSER}/noVNC/utils/self.pem
    /home/${CUSER}/noVNC/utils/launch.sh --vnc 127.0.0.1:5901 &
fi

echo "Press [return] to exit."
read