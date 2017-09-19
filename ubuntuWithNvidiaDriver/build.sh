#!/bin/sh

IMAGE_NAME=docker3d
NVIDIA_VERSION=$(/sbin/modinfo -F version nvidia)
# path to nvidia driver
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-${NVIDIA_VERSION}.run
if [ -f ${NVIDIA_DRIVER} ]; then
	echo "Using existing ${NVIDIA_DRIVER}..."
else
	wget -O ${NVIDIA_DRIVER} http://us.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_VERSION}/${NVIDIA_DRIVER} || exit 127
fi
/bin/cp -f ${NVIDIA_DRIVER} NVIDIA-DRIVER.run
######sudo docker build -t ${IMAGE_NAME} .
docker build -t ${IMAGE_NAME} .
