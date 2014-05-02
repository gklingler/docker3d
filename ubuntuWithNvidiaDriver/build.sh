#!/bin/sh

IMAGE_NAME=ubuntu_with_nvidia_driver
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-337.12.run  # path to nvidia driver

cp ${NVIDIA_DRIVER} NVIDIA-DRIVER.run
sudo docker build -t ${IMAGE_NAME} .
