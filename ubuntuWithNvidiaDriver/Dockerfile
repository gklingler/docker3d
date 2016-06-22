FROM ubuntu
MAINTAINER github/ElCoyote27

RUN apt-get update
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y binutils less x11-apps kmod sudo apt-utils
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
ENV DISPLAY :0

# Set a default command useful for debugging
CMD ["/bin/bash", "--login"]
