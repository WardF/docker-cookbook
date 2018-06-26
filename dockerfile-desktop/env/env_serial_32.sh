#!/bin/bash

alias active="echo 32-bit serial 1.8.x"

set -x

export CPPFLAGS="-I$HOME/environments/local-serial-32/include"
export CFLAGS="-I$HOME/environments/local-serial-32/include"
export LDFLAGS="-L$HOME/environments/local-serial-32/lib"
export LD_LIBRARY_PATH="$HOME/environments/local-serial-32/lib"
export DYLD_LIBRARY_PATH="$HOME/environments/local-serial-32/lib"
export PATH="$HOME/environments/local-serial-32/bin:$PATH"
export CMAKE_PREFIX_PATH=$HOME/environments/local-serial-32
set +x
