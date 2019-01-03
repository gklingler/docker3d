FROM ubuntu
MAINTAINER github/gklingler

RUN apt-get update
RUN apt-get install -y mesa-utils
RUN apt-get install -y module-init-tools
RUN apt-get install -y x11-utils

# Install nvidia driver
RUN apt-get install -y binutils
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
# Docker kernel already contains nvidia modules, all we need are the corresponding files
RUN sh /tmp/NVIDIA-DRIVER.run -a --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run
