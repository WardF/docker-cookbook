#!/bin/bash
#
# Roughly follows:
#
# https://github.com/HDFGroup/H5Tuner/wiki/Example

set -e

echo "Installing zlib"
wget http://zlib.net/zlib-1.2.8.tar.gz
tar xvzf zlib-1.2.8.tar.gz
pushd zlib-1.2.8
./configure --prefix=/usr
make -j 4 && sudo make install
popd


echo "Installing hdf5"
wget http://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.12/src/hdf5-1.8.12.tar.gz
tar xvzf hdf5-1.8.12.tar.gz
pushd hdf5-1.8.12
CC=mpicc FC=mpif90 CXX=mpic++ ./configure --prefix=/usr --enable-parallel --with-zlib=/usr --enable-hl
make -j 4 && sudo make install
popd

echo "Installing MiniXML"
wget http://www.msweet.org/files/project3/mxml-2.9.tar.gz
tar xvzf mxml-2.9.tar.gz
pushd mxml-2.9
./configure --prefix=/usr --enable-shared
make -j 4 && sudo make install
popd

echo "Installing Pyevolve"
wget http://pyevolve.sourceforge.net/distribution/0_6rc1/Pyevolve-0.6rc1.tar.gz
tar xvzf Pyevolve-0.6rc1.tar.gz
