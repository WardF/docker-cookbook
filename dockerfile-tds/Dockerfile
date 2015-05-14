#####
# Dockerfile for creating a custom thredds service
# that will perform aggregation for a directory mapped
# from the host to the docker image.
#####

FROM ubuntu:14.04
USER root
ENV HOME /root
WORKDIR /root

###
# Bring the system up to speed.
###

RUN apt-get update

RUN apt-get install -y default-jdk
RUN apt-get install -y wget
RUN apt-get install -y links
RUN apt-get install -y telnet
RUN apt-get install -y apache2
RUN apt-get install -y emacs
RUN apt-get install -y nano

###
# Kick off apache2 so that it is running when we start
# tomcat up.
###
RUN apache2ctl start

###
# Pre-download files so that we don't have to repeat
# this with downstream changes.
###

RUN wget http://download.nextag.com/apache/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz

RUN wget ftp://ftp.unidata.ucar.edu/pub/thredds/4.3/current/thredds.war

###
# Download/install tomcat
###


RUN mv apache-tomcat-8.0.22.tar.gz /usr/local
RUN cd /usr/local && tar -zxf apache-tomcat-8.0.22.tar.gz

###
# Copy over configuration files.
###

# Tomcat setenv.sh
COPY setenv.sh /usr/local/apache-tomcat-8.0.22/bin/
RUN chmod 755 /usr/local/apache-tomcat-8.0.22/bin/setenv.sh

# Tomcat users configuration.
COPY tomcat-users.xml /usr/local/apache-tomcat-8.0.22/conf/

# Set up the tomcat user
RUN useradd tomcat
RUN chown -R tomcat /usr/local/apache-tomcat-8.0.22


# Tomcat init script.
COPY tomcat /etc/init.d/
RUN chmod 755 /etc/init.d/tomcat
RUN update-rc.d tomcat defaults

# Start Tomcat so that it can install thredds.
RUN /etc/init.d/tomcat start

###
# Install thredds.
###

RUN chown tomcat thredds.war
RUN mv thredds.war /usr/local/apache-tomcat-8.0.22/webapps

RUN mkdir -p /usr/local/apache-tomcat-8.0.22/content
COPY thredds.tar.bz2 /usr/local/apache-tomcat-8.0.22/content/
RUN cd /usr/local/apache-tomcat-8.0.22/content && tar -jxf thredds.tar.bz2



###
# Final Items
###
COPY bootstrap_tomcat.sh /root/
COPY Dockerfile /root/
EXPOSE 8080

CMD /root/bootstrap_tomcat.sh