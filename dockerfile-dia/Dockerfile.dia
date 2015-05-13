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
#RUN apt-get -y upgrade

###
# Install some basics.
###

RUN apt-get install -y man nano
RUN apt-get install -y x11-utils x11-common
RUN apt-get install -y dia

###
# Copy over the utility run script, usage doc, so that we can
# mount a shared volume and copy it out to working dir,
# if that is easier.
###

COPY run_dia.sh /root/
COPY run_socat.sh /root/
COPY USAGE.md /root/

##
# Run dia on launch.
##
CMD /usr/bin/dia
