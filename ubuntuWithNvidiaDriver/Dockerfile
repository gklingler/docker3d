FROM ubuntu
MAINTAINER github/gklingler

RUN apt-get update
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y binutils less x11-apps kmod
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -s -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run
