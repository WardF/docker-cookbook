#!/bin/bash
#
# Utility script to convert from serial to parallel hdf5 environment.
#

echo "Installing parallel hdf5 over top of serial hdf5"

if [ -d ${HOME}/${HDF5_VER} ]; then
    rm -rf ${HOME}/${HDF5_VER}
fi

tar -jxf ${HOME}/${HDF5_FILE}
cd ${HDF5_VER}
CFLAGS="-Wno-format-security" CC=$(which mpicc) ./configure --disable-static --enable-shared --disable-fortran --enable-hl --enable-parallel --prefix=/usr && make -j 4 && sudo make install
