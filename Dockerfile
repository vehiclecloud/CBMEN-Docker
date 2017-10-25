FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y sudo
RUN sudo apt-get update
RUN sudo apt-get install -y git
RUN git clone https://github.com/internetofvehicles/ENCODERS
ADD prep.sh /ENCODERS/prep.sh
RUN /bin/bash -c "pushd /ENCODERS && ./prep.sh"
RUN sudo useradd -d /home/ubuntu ubuntu
RUN sudo mkdir -p /home/ubuntu/.Haggle
RUN sudo chown -R ubuntu:ubuntu /home/ubuntu
RUN sudo apt-get install -y vim
RUN sudo apt-get install -y iputils-ping net-tools telnet
ADD config-udptcp.xml /home/ubuntu/.Haggle/config.xml
RUN sudo chown -R ubuntu:ubuntu /home/ubuntu

ADD haggle.sh /haggle.sh
