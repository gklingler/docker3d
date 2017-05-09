#!/bin/sh

COMMAND=/bin/bash

if [ "x${DISPLAY}" = "x" ]; then
	docker run --privileged \
		-v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		-v="/var/tmp:/var/tmp:rw" \
		-i -t -u worker docker3d
else
	#xhost + # allow connections to X server
	xhost local:root
	docker run --privileged \
		-e "DISPLAY=unix:$(echo ${DISPLAY}|cut -d: -f2)" \
		-v="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		-v="/var/tmp:/var/tmp:rw" \
		-i -t -u worker docker3d
fi
