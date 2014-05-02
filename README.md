You can easily run applications that need opengl inside docker (with hardware acceleration of your graphic card) and display it directly on the X server of your host (without vnc).

Therefore the following things must be considered and are demonstrated by the files contained in this repo:
* install the same driver for the graphics card than on your host to get DRI support (see corresponding Dockerfile)
* you must permit connections to the X server of your host (this is what "xhost +" in run.sh does)
  * Note that "xhost +" is security wise not ideal as it allows connections the the X server from any host
* you must run the container with the arguments -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --privileged (see run.sh) - this enables the docker container to use the X server of your host. "--privileged" is essential if you want DRI support.

Depending on your graphics card, the directories ubuntuWithNvidiaDriver and ubuntuWithOpenSourceDrivers contain the files that demonstrate the necessary steps to build and run a docker container with hardware accelerated graphics.

### Build the image
#### if your host has an nvidia card and use the official nvidia driver
* Download the nvidia driver for Linux from the nvidia homepage (take care it is the same version as installed on your host) and place it into the directory ubuntuWithNvidiaDriver.
* Change to the directory ubuntuWithNvidiaDriver.
* Execute build.sh to build the ubuntu based image and install the nvidia driver.

#### if your host has an ati card and uses the official catalyst driver
Have not tested it, but procedure should be similar to the "nvidia" procedure.

#### if your host uses an open source driver
* Change to the directory ubuntuWithOpenSourceDrivers
* Execute build.sh to build the ubuntu based image and install (all!) available opensource drivers

### Crate a container and test it
* Execute ./run in the corresponding subdirectory to get a bash prompt in the created docker container.
* To see if you have hardware acceleration, call "glxinfo". You should see "direct rendering: Yes"
* Call for example "glxgears" to verify it's working.
