# dockerfile-ncdox

> You may find this project at https://registry.hub.docker.com/u/wardf


This project is used to create `Doxygen`-generated documentation for the specific netCDF branch (master by default).

In order for this to work, you ***must*** map a local directory to `/output` in the `Docker` container.

By default, this generates the **USER** documentation.  If you want the developer documentation (generated using `netcdf-c/Doxyfile.developer` you must specify `DEVDOX=ON`

## Examples

Generating **developer** documentation instead of **user** documenation:

    $ docker run --rm --it -v $(pwd):/output -e DEVDOX=ON wardf/ncdox

Generating documentation for the `master` branch:

    $ docker run --rm -it -v $(pwd):/output wardf/ncdox
    
Generating documentation for the `working` branch:

    $ docker run --rm -it -v $(pwd):/output -e CBRANCH=working wardf/ncdox
    
Generating documentation which uses server-side search:
  
    $ docker run --rm -it -v $(pwd):/output -e COPTS="-DDOXYGEN_ENABLE_SERVER_SIDE_SEARCH=ON" wardf/ncdox
    
Generating documentation using the local repository instead of the remote:

    $ docker run --rm -it -v $(pwd):/output $(pwd)/netcdf-c:/netcdf-c wardf/ncdox
    
> Note that in this last example any `CBRANCH` variable passed will be used as a *label*, but it does not have to reflect the actual branch of the local repository.