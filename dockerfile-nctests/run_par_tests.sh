#!/bin/bash

###
# Check out all the projects.
#
# If the project file has been mapped to a directory
# on the root of the docker image filesystem, use
# that instead.  If this is the case, we assume that
# it is already on the branch we want.  The branch
# environmental variable will need to be specified still,
# if we want it to show up in the build name on the
# appropriate dashboard.
#
# Check out the branch
# specified by "CBRANCH", "FBRANCH", "CXXBRANCH"
###

if [ -d "/netcdf-c" ]; then
    git clone /netcdf-c /root/netcdf-c
else
    git clone http://www.github.com/Unidata/netcdf-c
    cd netcdf-c
    git fetch
    git checkout $CBRANCH
    cd /root
fi

if [ -d "/netcdf-fortran" ]; then
    git clone /netcdf-fortran /root/netcdf-fortran
else
    git clone http://www.github.com/Unidata/netcdf-fortran
    cd netcdf-fortran
    git fetch
    git checkout $FBRANCH
    cd /root
fi

if [ -d "/netcdf-cxx4" ]; then
    git clone /netcdf-cxx4 /root/netcdf-cxx4
else
    git clone http://www.github.com/Unidata/netcdf-cxx4
    cd netcdf-cxx4
    git fetch
    git checkout $CXXBRANCH
    cd /root
fi


###
# Build & test netcdf-c, then install it so it
# can be used by the other projects.
###

cd /root

mkdir build-netcdf-c
cd build-netcdf-c
cmake /root/netcdf-c -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_HDF4=ON -DENABLE_EXTRA_TESTS=ON -DENABLE_MMAP=ON -DBUILDNAME_PREFIX="docker$BITNESS-parallel" -DBUILDNAME_SUFFIX="$CBRANCH" -DCMAKE_C_COMPILER=$(which mpicc) -DENABLE_PNETCDF=ON -DENABLE_PARALLEL_TESTS=ON $COPTS
make Experimental

make install


###
# Build & test netcdf-fortran
###
#
# CURRENTLY TEST_PARALLEL IS OFF DUE TO AN ERROR
# IN MPIEXEC ON DOCKER.
#
# Upon further investigation, this may be an HDF5 error.
# Look into it more closely, later down the road.

cd /root
mkdir build-netcdf-fortran
cd build-netcdf-fortran
cmake /root/netcdf-fortran -DBUILDNAME_PREFIX="docker$BITNESS-parallel" -DBUILDNAME_SUFFIX="$FBRANCH" -DTEST_PARALLEL=OFF -DCMAKE_Fortran_COMPILER=$(which mpif90) $FOPTS
make Experimental


###
# Build & test netcdf-cxx4.
###

cd /root
mkdir build-netcdf-cxx4
cd build-netcdf-cxx4
cmake /root/netcdf-cxx4 -DBUILDNAME_PREFIX="docker$BITNESS-parallel" -DBUILDNAME_SUFFIX="$CXXBRANCH" -DCMAKE_CXX_COMPILER=$(which mpic++) $CXXOPTS
make Experimental
