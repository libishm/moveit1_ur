# Docker instructions

This container will access to the users home directory and logged in as the user with their password and x sever access.  
The .docker folder of this repo contains convenience hell scripts for building and running the Docker container. These should be run from the root of the repo.

### Build Image

_run commands below from root of this repository_

Using convenience shell script

```shell
.docker/build_image.sh
```

Or

```shell
docker build --pull --rm -f ./.docker/Dockerfile  -t moveit1_ur:latest
```

### Run Image

note: On Ubuntu 20.04 --privileged flag is required on Ubuntu 22 it can be omitted

_run commands below from root of this repository_

Using convenience shell script

```shell
.docker/run_user.sh
```

or

```shell
docker run -it \
    --user=$(id -u $USER):$(id -g $USER) \
    --group-add sudo \
    --env="DISPLAY" \
    --env=QT_X11_NO_MITSHM=1 \
    --workdir="/dev_ws" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --net=host \
    --cap-add=sys_nice \
    moveit1_ur:latest
```

For nvidia-docker

```shell
.docker/run_user_nvidia.sh
```

or

```shell
docker run -it \
    --user=$(id -u $USER):$(id -g $USER) \
    --group-add sudo \
    --env="DISPLAY" \
    --env=QT_X11_NO_MITSHM=1 \
    --workdir="/dev_ws" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --net=host \
    --privileged \
    --cap-add=sys_nice \
    --gpus 'all,"capabilities=compute,display,graphics,utility"' \
    moveit1_ur:latest
```