#####
# Common stuff goes at the front,
# so that we can take advantage of the
# shared layers that docker provides.
#####

FROM wardf/nctests:serial

###
# Install some basics.
###

RUN apt-get update
RUN apt-get install -q -y valgrind
RUN apt-get install -q -y ubuntu-dev-tools
RUN apt-get install -q -y cmake
RUN apt-get install -q -y m4
RUN apt-get install -q -y flex
RUN apt-get install -q -y bison
RUN apt-get install -q -y autoconf
RUN apt-get install -q -y automake
RUN apt-get install -q -y libtool

WORKDIR /workdir

CMD /bin/bash

#CMD ["xinit", "--", "/usr/bin/Xvfb", ":1", "-screen", "0", "1024x768x24"]
