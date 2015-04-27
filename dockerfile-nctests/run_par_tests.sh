#!/bin/bash

###
# Check out all the projects.
###
git clone http://www.github.com/Unidata/netcdf-c
git clone http://www.github.com/Unidata/netcdf-fortran
git clone http://www.github.com/Unidata/netcdf-cxx4

###
# Check out the branch
# specified by "CBRANCH", "FBRANCH", "CXXBRANCH"
###

cd netcdf-c
git fetch
git checkout $CBRANCH
cd /root

cd netcdf-fortran
git fetch
git checkout $FBRANCH
cd /root

cd netcdf-cxx4
git fetch
git checkout $CXXBRANCH
cd /root


###
# Build & test netcdf-c, then install it so it
# can be used by the other projects.
###

cd /root

mkdir build-netcdf-c
cd build-netcdf-c
cmake /root/netcdf-c -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_HDF4=ON -DENABLE_EXTRA_TESTS=ON -DENABLE_MMAP=ON -DBUILDNAME_PREFIX="docker-parallel" -DBUILDNAME_SUFFIX="$CBRANCH" -DCMAKE_C_COMPILER=$(which mpicc) -DENABLE_PNETCDF=ON -DENABLE_PARALLEL_TESTS=ON
make Experimental

make install


###
# Build & test netcdf-fortran
###

cd /root
mkdir build-netcdf-fortran
cd build-netcdf-fortran
cmake /root/netcdf-fortran -DBUILDNAME_PREFIX="docker-parallel" -DBUILDNAME_SUFFIX="$FBRANCH" -DTEST_PARALLEL=ON -DCMAKE_C_COMPILER=$(which mpicc) -DCMAKE_Fortran_COMPILER=$(which mpif90)
make Experimental


###
# Build & test netcdf-cxx4.
###

cd /root
mkdir build-netcdf-cxx4
cd build-netcdf-cxx4
cmake /root/netcdf-cxx4 -DBUILDNAME_PREFIX="docker-parallel" -DBUILDNAME_SUFFIX="$CXXBRANCH" -DCMAKE_CXX_COMPILER=$(which mpic++)
make Experimental
