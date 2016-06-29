#!/bin/bash
#
# Utility script for downloading and installing h5tuner

echo "==================="
echo "Cloning from HDFGroup/H5Tuner"
echo "==================="

git clone git://github.com/HDFGroup/H5Tuner.git
cd H5Tuner

autoreconf -if

CC=`which mpicc` ./configure && make -j 4
