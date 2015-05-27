When this docker container is run, it will check out the following packages from the Unidata github site:

* netcdf-c
* netcdf-fortran
* netcdf-cxx4

Each package will be built and tested.  This way, we can see if any changes in `netcdf-c` break anything which depends on it (`netcdf-fortran` and `netcdf-cxx4`).

## Specifying an Alternative Branch

You can specify an alternative branch for `netcdf-c` than `master` using the following syntax.

    $ docker run -e CBRANCH="branch name" wardf/nctests

## Working with local copies instead of pulling from GitHub

It is possible to use local directories instead of pulling from github. You do this by mounting your local git directory to the root of the docker image filesystem, e.g.

    $ docker run -v $(pwd)/netcdf-c:/netcdf-c wardf/nctests
    
When the image runs, it will check for the existence of `/netcdf-c`, `/netcdf-fortran` and `/netcdf-cxx4`.  If they exist, the image will clone from these instead of pulling from GitHub.

> Note: Because it is cloning from a 'local' directory, it is important that you have that local directory already on the branch you want to analyze.  You will still need to set the appropriate Environmental Variable, however, if you want the build to be properly labelled for the CDash Dashboard.
    
## Environmental Variables

The following environmental variables can be used to control the behavior at runtime.

* `CBRANCH` - Git branch for `netcdf-c`
* `FBRANCH` - Git branch for `netcdf-fortran`
* `CXXBRANCH` - Git branch for `netcdf-cxx4`
* `COPTS` - CMake options for `netcdf-c`
* `FOPTS` - CMake options for `netcdf-fortran`
* `CXXOPTS` - CMake options for `netcdf-cxx4`
* `RUNF` - Set to `OFF`, `FALSE`, anything but `TRUE`, to disable running fortran tests.
* `RUNCXX` - Set to `OFF`, `FALSE`, anything but `TRUE`, to disable running netcdf-cxx4 tests.
* `USEDASH` - Set to any non-`TRUE` value to disable using the remote dashboard.