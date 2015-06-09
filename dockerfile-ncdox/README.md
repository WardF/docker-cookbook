# dockerfile-ncdox

This project is used to create `Doxygen`-generated documentation for the specific netCDF branch (master by default).

In order for this to work, you ***must*** map a local directory to `/output` in the `Docker` container.

## Examples

Generating documentation for the `master` branch:

    $ docker run --rm -it -v $(pwd):/output wardf/ncdox
    
Generating documentation for the `working` branch:

    $ docker run --rm -it -v $(pwd):/output -e CBRANCH=working wardf/ncdox
    
Generating documentation using the local repository instead of the remote:

    $ docker run --rm -it -v $(pwd):/output $(pwd)/netcdf-c:/netcdf-c wardf/ncdox
    
> Note that in this last example any `CBRANCH` variable passed will be used as a *label*, but it does not have to reflect the actual branch of the local repository.