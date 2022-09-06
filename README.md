# Docker container for Moveit 1 and Universal Robots

Only the ur10e_moveit_config has been updated  

To update ur(x)_moveit_config
- Use the setup assistant to regenerate pkg
- Set acceleration_limits to true and set max_acc in config/joint_limits.yaml

## Docker

### Build

```shell
docker build --pull --rm -f ./.docker/Dockerfile  -t moveit1_ur:latest
```

### Run

On ubuntu 20.04 --privileged flag is required

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
    moveit1_ur:latest
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
    moveit1_ur:latest
```

### IDE

#### pycharm

install Pycharm using Jetbrains toolbox, once in the container run

```shell
/home/$UID/.local/share/JetBrains/Toolbox/apps/PyCharm-P/ch-0/222.3739.56/bin/pycharm.sh
```

#### vscode

install the following vs code extensions
- [docker](https://code.visualstudio.com/docs/containers/overview)
- [remote development](https://code.visualstudio.com/docs/remote/remote-overview)

dev_container_config for Python development provided in .docker folder


#### terminator

terminator is installed in the container for multiple terminals launch terminator from the CLI inside the container


## Running on the robot

TODO add instruction's for pendant

Launch the following files from the container

```shell
roslaunch ur_robot_driver ur10e_bringup.launch robot_ip:=192.168.1.100
```

```shell
roslaunch ur10e_moveit_config ur10e_moveit_planning_execution.launch
```

```shell
roslaunch ur10e_moveit_config moveit_rviz.launch
```

