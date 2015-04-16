#####
# Common stuff goes at the front,
# so that we can take advantage of the
# shared layers that docker provides.
#####
#FROM besn0847/ubuntu32
FROM ubuntu:utopic
USER root
ENV HOME /root
WORKDIR /root

RUN apt-get update

###
# Install some basics.
###

RUN apt-get install -y ubuntu-dev-tools
RUN apt-get install -y g++
RUN apt-get install -y gfortran
RUN apt-get install -y libtool automake autoconf
RUN apt-get install -y m4
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y libhdf5-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y curl
###
# Copy over the utility run script, usage doc, so that we can
# mount a shared volume and copy it out to working dir,
# if that is easier.
###

COPY run_all_tests.sh /root/
RUN apt-get install -y cmake
##
# Run dia on launch.
##
CMD sh /root/run_all_tests.sh
