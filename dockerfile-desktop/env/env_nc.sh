#!/bin/bash

alias active="echo serial 1.10.2 + netCDF"

set -x

export CPPFLAGS="-I$HOME/environments/local-nc/include"
export CFLAGS="-I$HOME/environments/local-nc/include"
export LDFLAGS="-L$HOME/environments/local-nc/lib"
export LD_LIBRARY_PATH="$HOME/environments/local-nc/lib"
export DYLD_LIBRARY_PATH="$HOME/environments/local-nc/lib"
export PATH="$HOME/environments/local-nc/bin:$PATH"
export CMAKE_PREFIX_PATH=$HOME/environments/local-nc
set +x
