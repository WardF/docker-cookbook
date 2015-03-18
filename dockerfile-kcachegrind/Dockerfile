FROM ubuntu:14.04


###
# Install chrome from the command line.
###

###
# Install various packages.
###

RUN apt-get update && apt-get install -y x11-utils x11-common x11vnc xvfb fluxbox man xinit kcachegrind

###
# Configure vnc, xvfb.
# Taken from https://docs.docker.com/reference/builder/#entrypoint
###

###
#
# Set up a non-root user,
# use it to configure fluxbox, xinitrc.
#
###

RUN useradd -ms /bin/bash vncuser

USER vncuser
ENV HOME /home/vncuser
WORKDIR /home/vncuser

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

RUN mkdir ~/.fluxbox/
RUN bash -c 'echo "xterm &" >> ~/.fluxbox/startup'
RUN echo "/usr/bin/fluxbox -log ~/.fluxbox/log " >> ~/.fluxbox/startup


###
# Set up an alias for google-chrome that turns off
# sandboxing (it won't work otherwise).
###

RUN echo 'alias google-chrome="google-chrome --no-sandbox"' >> ~/.bashrc

###
# Create a .xinitrc file.
#
# The environmental variable APORT = 5901 by default but can be
# overridden when invoking 'docker run', e.g.
#   $ docker run -e APORT=4435
###
RUN echo '/usr/bin/x11vnc -usepw -display :1 -autoport $APORT -forever -repeat &' >> ~/.xinitrc
RUN echo "/usr/bin/startfluxbox" >> ~/.xinitrc

ENV APORT 5901
EXPOSE 5901

CMD ["xinit", "--", "/usr/bin/Xvfb", ":1", "-screen", "0", "1440x900x24"]
