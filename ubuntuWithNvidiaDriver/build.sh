#!/bin/sh

IMAGE_NAME=ubuntu_with_nvidia_driver
NVIDIA_DRIVER=NVIDIA-Linux-x86_64-*.run  # path to nvidia driver

nvidia_host_version() {
    echo "$(head -n1 </proc/driver/nvidia/version | cut -d' ' -f 9)"
}

linux_arch() {
    echo "$(uname)-$(arch)"
}

nvidia_url() {
    echo "https://http.download.nvidia.com/XFree86/$(linux_arch)/$(nvidia_host_version)/NVIDIA-$(linux_arch)-$(nvidia_host_version).run"
}

[ -f "NVIDIA-DRIVER.run" ] || wget $(nvidia_url) -O NVIDIA-DRIVER.run || echo "Please download nvidia driver with same version as the host. Probably $(nvidia_host_version). Guessed URL $(nvidia_url) but it did not work"
docker build -t ${IMAGE_NAME} .
