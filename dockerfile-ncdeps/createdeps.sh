#!/bin/bash
#
# Script to build dependencies used by netCDF-C.
#
# This includes CMake, HDF4, HDF5.  The resultant tarball
# is assumed to be used in a docker image, but it doesn't have
# to be.
#
# Environmental variables must be defined before this
# script is run.  Since it will most commonly be used in a
# docker container, see the Dockerfile for defaults,
# and set different values when using `docker run`.



set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

###
# Function to capture settings in a file included in the tarball.
###

OPSFILE="/root/${OPSFILENAME}"

CREATEOPSFILE()
{

    echo "$(date)" > $OPSFILE
    echo "" >> $OPSFILE
    echo -e "* OPSFILE\t${OPSFILE}" >> $OPSFILE
    echo "" >> $OPSFILE
    echo -e "* TARGDIR\t${TARGDIR}" >> $OPSFILE
    echo -e "* TARGFILE\t${TARGFILE}" >> $OPSFILE
    echo -e "* CPUS\t\t${CPUS}" >> $OPSFILE
    echo "" >> $OPSFILE
    echo -e "* BUILDCMAKE:\t${BUILDCMAKE}" >> $OPSFILE
    echo -e "* BUILDHDF4:\t${BUILDHDF4}" >> $OPSFILE
    echo -e "* BUILDHDF5:\t${BUILDHDF5}" >> $OPSFILE
    echo "" >> $OPSFILE
    echo -e "* CMAKE_VER:\t${CMAKE_VER}" >> $OPSFILE
    echo -e "* HDF4_VER:\t${HDF4_VER}" >> $OPSFILE
    echo -e "* HDF5_VER:\t${HDF5_VER}" >> $OPSFILE


}

cd /root

##
# Check for a target directory,
# /working by default.
##

if [ ! -d "/working" ]; then
    cat /root/README.md
    exit 0
fi

###
# Build CMake, if requested.
###
if [ "x${BUILDCMAKE}" == "xTRUE" ]; then

    CMAKE_VDIR="v$(echo ${CMAKE_VER} | cut -d "." -f 1,2)"
    CMAKE_PREF="cmake-${CMAKE_VER}"
    CMAKE_FILE="${CMAKE_PREF}.tar.gz"
    wget "http://www.cmake.org/files/${CMAKE_VDIR}/${CMAKE_FILE}"
    tar -zxf "${CMAKE_FILE}"

    cd "${CMAKE_PREF}" && ./configure --prefix=${TARGDIR} && make install -j ${CPUS} && ldconfig
    cd /root
fi

###
# Build HDF4, if requested.
###
if [ "x${BUILDHDF4}" == "xTRUE" ]; then

    HDF4_PREF="hdf-${HDF4_VER}"
    HDF4_FILE="${HDF4_PREF}.tar.bz2"
    wget "http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/${HDF4_FILE}"

    tar -jxf "${HDF4_FILE}"
    cd "${HDF4_PREF}" && ./configure --disable-static --enable-shared --disable-netcdf --disable-fortran --prefix=${TARGDIR} && make install -j ${CPUS}
    cd /root
fi

###
# Build HDF5, if requested.
###
if [ "x${BUILDHDF5}" == "xTRUE" ]; then

    HDF5_PREF="hdf5-${HDF5_VER}"
    HDF5_FILE="${HDF5_PREF}.tar.bz2"

    wget "http://www.hdfgroup.org/ftp/HDF5/releases/${HDF5_PREF}/src/${HDF5_FILE}"
    tar -jxf "${HDF5_FILE}"

    cd "${HDF5_PREF}" && ./configure --disable-static --enable-shared --disable-fortran --enable-hl --prefix=${TARGDIR} && make install -j ${CPUS}
    cd /root
fi

###
# Build netCDF, if requested.
###
if [ "x${BUILDNC}" == "xTRUE" ]; then

    git clone http://github.com/Unidata/netcdf-c
    cd netcdf-c
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=${TARGDIR} -DENABLE_TESTS=OFF
    make -j ${CPUS}
    make install
    cd /root
fi
###
# Create the options file
###
echo "Creating Options file: ${OPSFILE}"
CREATEOPSFILE

###
# Tar up the results.
###
/root/package_travis_deps.sh

set -x
cp "${TARGFILE}" "/working"
set +x



echo ""
echo "Finished. Press [Return] to exit."
read
