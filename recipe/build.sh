#!/bin/bash

export PYTHON=
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,$PREFIX/lib"
export CFLAGS="$CFLAGS -fPIC -I$PREFIX/include"

# Shared.
mkdir build_ecmwf_grib && cd build_ecmwf_grib
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D ENABLE_JPG=1 \
      -D ENABLE_NETCDF=1 \
      -D ENABLE_PNG=1 \
      -D ENABLE_FORTRAN=1 \
      -D ENABLE_PYTHON=0 \
      $SRC_DIR


make
ctest
make install
