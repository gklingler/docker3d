#!/bin/sh

COMMAND=/bin/bash

# allows docker to connect to x11 server at the host
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -


docker run --privileged -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw"  \
       -e "XAUTHORITY=$XAUTH" -v="$XAUTH:$XAUTH:rw" \
       -it ubuntu_with_nvidia_driver $COMMAND
