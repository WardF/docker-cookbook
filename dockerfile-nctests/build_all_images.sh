#!/bin/bash

dohelp ()
{
    echo "Usage: $0 [-i]"
    echo -e "\t -i     Build 32 bit images."
}

DO32=""

while getopts "i" o; do
    case "${o}" in
        i)
            DO32="TRUE"
            ;;
        *)
            dohelp
            exit 0
    esac
done

if [ "x$DO32" == "xTRUE" ]; then
    echo "Building 32-bit images."

    docker build -t wardf/nctests:base32 -f Dockerfile.base32 .
    docker build -t wardf/nctests:serial32 -f Dockerfile.serial32 .
    docker build -t wardf/nctests:openmpi32 -f Dockerfile.openmpi32 .
    docker build -t wardf/nctests:mpich32 -f Dockerfile.mpich32 .
else
    echo "Building 64-bit images."

    docker build -t wardf/nctests:base -f Dockerfile.base .
    docker build -t wardf/nctests -f Dockerfile.serial .
    docker build -t wardf/nctests:serial -f Dockerfile.serial .
    docker build -t wardf/nctests:openmpi -f Dockerfile.openmpi .
    docker build -t wardf/nctests:mpich -f Dockerfile.mpich .

fi

echo "Finished"
