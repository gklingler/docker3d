FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y mesa-utils
RUN apt-get install -y binutils
RUN apt-get install -y module-init-tools
RUN apt-get install -y x11-utils
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run
