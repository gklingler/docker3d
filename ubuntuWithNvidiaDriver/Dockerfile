FROM ubuntu
MAINTAINER github/gklingler

RUN apt-get update
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y binutils less x11-apps kmod sudo apt-utils
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -s -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run
RUN adduser --disabled-password --gecos '' user1
RUN adduser user1 sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
