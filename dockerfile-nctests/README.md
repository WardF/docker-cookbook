When this docker container is run, it will check out the following packages from the Unidata github site:

* netcdf-c
* netcdf-fortran
* netcdf-cxx4

Each package will be built and tested.  This way, we can see if any changes in `netcdf-c` break anything which depends on it (`netcdf-fortran` and `netcdf-cxx4`).

## Specifying an Alternative Branch

You can specify an alternative branch for `netcdf-c` than `master` using the following syntax.

    $ docker run -e CBRANCH="branch name" wardf/nctests
    
## Environmental Variables

The following environmental variables can be used to control the behavior at runtime.

Variable | Behavior | Default Value
----|----|----
CBRANCH | Git branch for `netcdf-c` | `master`
FBRANCH | Git branch for `netcdf-fortran` | `master`
CXXBRANCH | Git branch for `netcdf-cxx4` | `master`
COPTS | CMake options for `netcdf-c` | *Empty*
FOPTS | CMake options for `netcdf-fortran` | *Empty*
CXXOPTS | CMake options for `netcdf-cxx4` | *Empty*