#!/bin/sh

IMAGE_NAME=ubuntu_with_nvidia_driver
NVIDIA_VERSION=$(/sbin/modinfo -F version nvidia)
# path to nvidia driver
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-${NVIDIA_VERSION}.run
if [ -f ${NVIDIA_DRIVER} ]; then
	cp ${NVIDIA_DRIVER} NVIDIA-DRIVER.run
else
	wget -O ${NVIDIA_DRIVER} http://us.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_VERSION}/${NVIDIA_DRIVER} && \
	cp ${NVIDIA_DRIVER} NVIDIA-DRIVER.run || exit 127
fi
sudo docker build -t ${IMAGE_NAME} .
