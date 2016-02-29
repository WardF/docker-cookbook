#!/bin/bash
# Utility script to set one of two different
# environments, either serial or parallel.
#
#

DOHELP() {

    echo "Usage: $0 [par | serial | default | summary]"
    echo ""

}

DOSUMMARY() {

    echo "Current Environment: $CUR_ENV"
    echo "o C_INCLUDE_PATH: ${C_INCLUDE_PATH}"
    echo "o CPLUS_INCLUDE_PATH: ${CPLUS_INCLUDE_PATH}"
    echo "o CPATH: ${CPATH}"
    echo "o LIBRARY_PATH: ${LIBRARY_PATH}"
    echo "o LD_LIBRARY_PATH: ${LD_LIBRARY_PATH}"
    echo ""

}

if [ "x$CUR_ENV" == "x" ]; then
    export OLD_C_INCLUDE_PATH=$C_INCLUDE_PATH
    export OLD_CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH
    export OLD_CPATH=$CPATH
    export OLD_LIBRARY_PATH=$LIBRARY_PATH
    export OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
fi

if [ $# -lt 1 ]; then
    DOHELP
    echo ""
    DOSUMMARY
    echo ""
    exit 0
fi

case $1 in
    serial)
        export CUR_ENV "serial"
        CURPREF="/home/${CIUSER}/libs/par"
        export C_INCLUDE_PATH="${CURPREF}/include"
        export CPLUS_INCLUDE_PATH="${CURPREF}/include"
        export CPATH="${CURPREF}/include"
        export LIBRARY_PATH="${CURPREF}/lib"
        export LD_LIBRARY_PATH="${CURPREF}/lib"
        ;;
    par)
        export CUR_ENV "par"
        CURPREF="/home/${CIUSER}/libs/par"
        export C_INCLUDE_PATH="${CURPREF}/include"
        export CPLUS_INCLUDE_PATH="${CURPREF}/include"
        export CPATH="${CURPREF}/include"
        export LIBRARY_PATH="${CURPREF}/lib"
        export LD_LIBRARY_PATH="${CURPREF}/lib"
        ;;
    default)
        export CUR_ENV ""
        export C_INCLUDE_PATH=$OLD_C_INCLUDE_PATH
        export CPLUS_INCLUDE_PATH=$OLD_CPLUS_INCLUDE_PATH
        export CPATH=$OLD_CPATH
        export LIBRARY_PATH=$OLD_LIBRARY_PATH
        export LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH
        ;;
    summary)
        DOSUMMARY()
        exit
        ;;
esac

echo "Setting environment to $1"
echo ""
DOSUMMARY
echo ""
