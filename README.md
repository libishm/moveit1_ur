# Docker container for Moveit 1

## Docker

### Build

```shell
docker build --pull --rm -f ./.docker/Dockerfile  -t moveit1:latest
```

### Run

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
    moveit1:latest
```

When using nvidia-docker

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
    --gpus 'all,"capabilities=compute,display,graphics,utility"' \
    moveit1:latest
```

### IDE

#### pycharm

install Pycharm using Jetbrains toolbox, once in the container run

```shell
/home/v/.local/share/JetBrains/Toolbox/apps/PyCharm-P/ch-0/222.3739.56/bin/pycharm.sh
```

#### vscode

install docker extension, more info [here](https://code.visualstudio.com/docs/remote/containers)

dev_container_config for Python development provided in .docker folder
