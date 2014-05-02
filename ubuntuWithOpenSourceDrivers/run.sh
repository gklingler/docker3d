#!/bin/sh

COMMAND=/bin/bash

xhost +localhost # allow connections to X server from localhost
docker run --privileged -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  -i -t ubuntu_with_opensource_drivers $COMMAND
