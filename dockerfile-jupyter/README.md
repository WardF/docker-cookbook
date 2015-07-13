# dockerfile-jupyter

This project is used to build a jupyter server image.

## References

## Usage

Run and map a specific directory that contains iPython notebooks into the working directory of the container.

    $ docker run --rm -it -v $(pwd):/notebooks -P wardf/jupyter
