#####
# Common stuff goes at the front,
# so that we can take advantage of the
# shared layers that docker provides.
#####

FROM ubuntu:utopic
USER root
ENV HOME /root
WORKDIR /root

RUN apt-get update
RUN apt-get -y upgrade

###
# Install some basics.
###

RUN apt-get install -y man nano
RUN apt-get install -y x11-utils x11-common
RUN apt-get install -y dia

RUN mkdir -p /root/.local/share

CMD /usr/bin/dia