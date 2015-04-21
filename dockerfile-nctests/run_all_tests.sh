#!/bin/bash

###
# Check out all the projects.
###
git clone http://www.github.com/Unidata/netcdf-c
git clone http://www.github.com/Unidata/netcdf-fortran
git clone http://www.github.com/Unidata/netcdf-cxx4

###
# Check out the branch
# specified by "CBRANCH"
###

cd netcdf-c
git fetch
git checkout $CBRANCH

###
# Build & test netcdf-c, then install it so it
# can be used by the other projects.
###

cd /root

mkdir build-netcdf-c && cd build-netcdf-c && cmake /root/netcdf-c -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_HDF4=ON -DENABLE_EXTRA_TESTS=ON && make Experimental

make install


###
# Build & test netcdf-fortran
###

cd /root
mkdir build-netcdf-fortran && cd build-netcdf-fortran && cmake /root/netcdf-fortran && make Experimental


###
# Build & test netcdf-cxx4.
###

cd /root
mkdir build-netcdf-cxx4 && cd build-netcdf-cxx4 && cmake /root/netcdf-cxx4 && make Experimental
