#####
# Common stuff goes at the front,
# so that we can take advantage of the
# shared layers that docker provides.
#####

FROM wardf/nctests:base

###
# Install some basics.
###

RUN apt-get update
RUN apt-get install -q -y valgrind
RUN apt-get install -q -y kcachegrind
RUN apt-get install -q -y x11-utils x11-common
WORKDIR /workdir

COPY run_socat.sh /root/
COPY run_callgrind_env.sh /root/
COPY README.md /root/
COPY Dockerfile /root/

CMD /bin/bash