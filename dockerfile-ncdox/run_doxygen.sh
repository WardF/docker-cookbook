#!/bin/bash

###
# Set up error handling,
# signal trapping. This allows us
# to send Ctrl-C from the command line
# where Docker was invoked.
###

set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

###
# Ensure that an output directory has been
# mapped. If not, send a message and exit.
###
if [ ! -d "/output" ]; then
    echo "Error. You must provide an '/output' directory to store the documentation."
    echo ""
    echo "Example:"
    echo -e "\t docker run --rm -it -v $(pwd):/output [docker image]"
    echo ""
    cat /root/README.md
    echo ""
    exit 0
fi

###
# Check out netcdf-c, unless a local repository
# has been mapped to `/netcdf-c`
###

if [ -d "/netcdf-c" ]; then
    echo "Using local netcdf-c repository"
    git clone /netcdf-c /root/netcdf-c
else
    echo "Using remote netcdf-c repository"
    git clone http://www.github.com/Unidata/netcdf-c
    cd netcdf-c
    git fetch
    git checkout $CBRANCH
    cd /root
fi

###
# Use CMake to configure the project,
# build the documentation, then
# copy the 'html' directory to '/output'. This
# will avoid a file explosion that might otherwise
# happen on the host system if we copied the
# *content* of the html directory to '/output'
###

###
# If DEVDOX=ON, we want to generate developer documentation.
# otherwise we'll generate user documentation.
###
DOCTYPE="user"
if [ "x$DEVDOX" == "xON" ]; then
    cd /root/netcdf-c
    doxygen Doxyfile.developer
    DOCTYPE="developer"
else
    cd /root
    mkdir build-netcdf-dox
    cd build-netcdf-dox
    cmake /root/netcdf-c -DENABLE_TESTS=OFF -DENABLE_DOXYGEN=ON $COPTS
    make -j 4
    cd docs
    DOCTYPE="user"
fi

TARGDIR=/output/$DOCTYPE-docs-$CBRANCH-html

if [ ! -d $(pwd)/html ]; then
    echo "Error: No directory $(pwd)/html!"
    exit 1
else
    if [ -d $TARGDIR ]; then
        TMPDIR=$(date +%s)
        echo "$TARGDIR exists. Moving to $TARGDIR.$TMPDIR"
        mv $TARGDIR $TARGDIR.$TMPDIR
    fi

    echo "Copying html directory to $TARGDIR"
    if [ "x$DEVDOX" == "xON" ]; then
        echo "*** This may take a while. ***"
    fi

    cp -R $(pwd)/html $TARGDIR
fi

echo "Finished"
