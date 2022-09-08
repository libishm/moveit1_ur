# Docker container for Moveit 1 and Universal Robots

Note: Only the ur10e_moveit_config has been updated, in case you want this repo with a different ur robot you will need to update the corresponding moveit_config.

To update ur(x)_moveit_config
- Use the setup assistant to regenerate pkg
- Set acceleration_limits to true and set max_acc in config/joint_limits.yaml

## Docker

The .docker folder of this repo contains convenience hell scripts for building and running the Docker container. These should be run from the root of the repo.

### Docker installation

Follow instructions from Docker [docs](https://docs.docker.com/engine/install/ubuntu/)

To enable Docker to use Nvidia driver (Nvidia driver is not compatible with preempt_rt kernel) follow instructions from Nvidia [docs](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

### Build

```shell
.docker/build_image.sh
```
or

```shell
docker build --pull --rm -f ./.docker/Dockerfile  -t moveit1_ur:latest
```

### Run

On Ubuntu 20.04 --privileged flag is required on Ubuntu 22 it can be omitted

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
    moveit1_ur:latest
```

For nvidia-docker

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
    --privileged \
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

These instructions assume
- Robot IP: 192.168.56.101
- Docker Host IP: 192.168.56.1

Launch the following files from the container

```shell
roslaunch ur_robot_driver ur10e_bringup.launch robot_ip:=192.168.56.101 \         
  kinematics_config:=/dev_ws/src/universal_robot/ur10e_moveit_config/config/iaac_ur10e.yaml
```

On the UR pendant start the URcaps program.  
If URcaps fails to connect add the following rule to ufw

```shell
sudo ufw allow from 192.168.56.101 to 192.168.56.1
```


Then launch the following.

```shell
roslaunch ur10e_moveit_config ur10e_moveit_planning_execution.launch
```

```shell
roslaunch ur10e_moveit_config moveit_rviz.launch
```

