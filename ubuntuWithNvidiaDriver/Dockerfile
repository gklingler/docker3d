FROM ubuntu:16.04
MAINTAINER github/ElCoyote27

ENV http_proxy "http://imladris.lasthome.solace.krynn:3128"
ENV ftp_proxy "http://imladris.lasthome.solace.krynn:3128"
ENV https_proxy "http://imladris.lasthome.solace.krynn:3128"
ENV no_proxy "localhost.localdomain,localhost,127.0.0.1,.localdomain4,localhost4,.localdomain6,localhost6,.lasthome.solace.krynn"

# Workaround for issues with mirrors..
RUN echo 'options ndots:2 timeout:2 attempts:2 single-request' >> /etc/resolv.conf
# RUN echo 'Acquire::http::Proxy "http://imladris.lasthome.solace.krynn:3128";' >> /etc/apt/apt.conf.d/01-vendor-ubuntu
# RUN sed -i s/http/ftp/ /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y sudo binutils less x11-apps kmod apt-utils python python-tk pkg-config nano iproute
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run

# Run NVidia driver install
RUN sh /tmp/NVIDIA-DRIVER.run -s -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

# Add 'worker' user
RUN adduser --disabled-password --gecos 'Runtime user' worker
RUN adduser worker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# allow the worker user to access video devices
RUN usermod -a -G video worker

WORKDIR /home/worker
# are taken from GNU su manual
ENV           HOME          /home/worker
ENV           SHELL         /bin/bash
ENV           USER          worker
ENV           LOGNAME       worker
ENV           LANG          en_US.UTF-8
ENV           LC_ALL        en_US.UTF-8

# This helps not forgetting setting DISPLAY=:0 when running
# tests outside of test.sh
#ENV DISPLAY :0

USER worker

# Set a default command useful for debugging
CMD ["/bin/bash", "--login"]
