#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  #sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  #apt-get update && \
  apt-get -y upgrade && \
  #apt-get install -y build-essential && \
  #apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget && \
  apt-get install -y openjdk-7-jre && \
  mkdir /opt/tomcat && \
  cd /opt/tomcat && \
  wget http://apache.claz.org/tomcat/tomcat-7/v7.0.73/bin/apache-tomcat-7.0.73.tar.gz  && \
  rm -rf /var/lib/apt/lists/* && \
  tar xvf apache-tomcat-7.0.73.tar.gz -C /opt/tomcat --strip-components=1 && \
  rm apache-tomcat-7.0.73.tar.gz
  
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN 

EXPOSE 8080
WORKDIR /opt/tomcat

CMD ["/opt/tomcat/bin/catalina.sh", "run"]  
