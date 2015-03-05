FROM ubuntu:14.04

RUN apt-get update && apt-get install -y x11-utils x11-common x11vnc xvfb firefox

##
# Replace 1000 with your user / group id
###
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/idvuser && \
    echo "idvuser:x:${uid}:${gid}:IDVUser,,,:/home/idvuser:/bin/bash" >> /etc/passwd && \
    echo "idvuser:x:${uid}:" >> /etc/group && \
    echo "idvuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/idvuser && \
    chmod 0440 /etc/sudoers.d/idvuser && \
    chown ${uid}:${gid} -R /home/idvuser
##
# Move the IDV over.
##
ADD IDV5.tar.bz2 /home/idvuser/

###
# Configure vnc, xvfb.
# Taken from https://docs.docker.com/reference/builder/#entrypoint
###

RUN mkdir /home/idvuser/.vnc
RUN chown -R idvuser:idvuser /home/idvuser
RUN sudo -u idvuser x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN sudo -u idvuser bash -c 'echo "xterm" >> /home/idvuser/.bashrc'

###
# Clean up permissions.
###
RUN chown -R idvuser:idvuser /home/idvuser

USER idvuser
ENV HOME /home/idvuser
WORKDIR /home/idvuser

EXPOSE 5900
CMD ["x11vnc", "-forever", "-usepw", "-create"]


