#!/bin/bash

dohelp ()
{
    echo "Usage: $0 [-i]"
    echo -e "\t -i     Push 32 bit images."
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
    echo "Pushing 32-bit images."
    docker push wardf/nctests:base32
     docker push wardf/nctests:serial32
    docker push wardf/nctests:openmpi32
    docker push wardf/nctests:mpich32

else
    echo "Pushing 64-bit images."
    docker push wardf/nctests:base
    docker push wardf/nctests
    docker push wardf/nctests:serial
    docker push wardf/nctests:openmpi
    docker push wardf/nctests:mpich

fi

echo "Finished"
