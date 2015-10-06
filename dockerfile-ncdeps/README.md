# dockerfile-ncdeps

This project is used to create a tarball containing the netcdf dependencies.  For now, it assumes non-MPI builds and untars everything into /usr/local on the docker image.

> The dependencies are created when the docker image is run; it does not contain them by default.  So, this image can take a while to run!

## Dependencies Created

The following dependencies are created when the image is run.

* CMake
* hdf4
* hdf5

## Running wardf/ncdeps

You will need to provide a volume mapping to save the resultant tarball in.

    $ docker run --rm -it -v $(pwd):/working wardf/ncdeps

## Environmental Variables

### Build Platform Variables

* TARGDIR - `/usr/local` by default.
* CPUS - `2` by default. Number of CPUs to use when building.

### Version Variables

* CMAKE_VER - `3.3.2`
* HDF4_VER - `4.2.11`
* HDF5_VER - `1.8.15-patch1`

### Flow Control Variables

* BUILDCMAKE - `TRUE` by default
* BUILDHDF4 - `TRUE` by default
* BUILDHDF5 - `TRUE` by default
