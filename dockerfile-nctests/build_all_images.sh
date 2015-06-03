#!/bin/bash

dohelp ()
{
    echo ""
    echo "Usage: $0 -[ix] -p [image name prefix]"
    echo -e "\t -i     Build 32-bit images."
    echo -e "\t -x     Build 64-bit images."
    echo -e "\t -p     Specify an image name. Default: wardf/nctests"
    echo ""
}

DO32=""
DO64=""
IPREF="wardf/nctests"

if [ $# -lt 1 ]; then
    dohelp
    exit 0
fi

while getopts "ixp:" o; do
    case "${o}" in
        i)
            DO32="TRUE"
            ;;
        x)
            DO64="TRUE"
            ;;
        p)
            IPREF=${OPTARG}
            if [ "x$IPREF" == "x" ]; then
                dohelp
                exit 0
            fi
            ;;
        *)
            dohelp
            exit 0
    esac
done

if [ "x$DO32" == "xTRUE" ]; then
    echo "Building 32-bit images."

    docker build -t $IPREF:base32 -f Dockerfile.base32 .
    docker build -t $IPREF:serial32 -f Dockerfile.serial32 .
    docker build -t $IPREF:openmpi32 -f Dockerfile.openmpi32 .
    docker build -t $IPREF:mpich32 -f Dockerfile.mpich32 .

fi

if [ "x$DO64" == "xTRUE" ]; then
    echo "Building 64-bit images."

    docker build -t $IPREF:base -f Dockerfile.base .
    docker build -t $IPREF -f Dockerfile.serial .
    docker build -t $IPREF:serial -f Dockerfile.serial .
    docker build -t $IPREF:openmpi -f Dockerfile.openmpi .
    docker build -t $IPREF:mpich -f Dockerfile.mpich .

fi

echo "Finished"
