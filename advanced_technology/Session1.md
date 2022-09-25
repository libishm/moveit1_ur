# MRAC II _ Advanced Technology Session 1

## Installation

### Docker

Follow instructions from Docker [docs](https://docs.docker.com/engine/install/ubuntu/)

Follow the first chapter of [linux post installation instructions](https://docs.docker.com/engine/install/linux-postinstall/), manage docker as non-root user

To enable Docker to use Nvidia driver (Nvidia driver is not compatible with preempt_rt kernel) follow instructions from Nvidia [docs](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

Test your installation by running

```shell
docker run hello-world
```

if Nvidia

```shell
docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi
```

### vs code

#### vscode (recommended)

Install the following vs code extensions

- [docker](https://code.visualstudio.com/docs/containers/overview)
- [remote development](https://code.visualstudio.com/docs/remote/remote-overview)

dev_container_config for Python development provided in .docker folder


## Build Image

_run commands below from root of this repository_

Using convenience shell script

```shell
.docker/build_image.sh
```

Or

```shell
docker build --pull --rm -f ./.docker/Dockerfile  -t moveit1_ur:latest
```

## Run Image

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

# TODO

#### terminator

terminator is installed in the container for multiple terminals launch terminator from the CLI inside the container

### Using this repo

### git

Fork and clone repo

_TODO_ remove submodules and merge into single repo

### configure vs code dev container

In vs code open the command palette (Ctrl-Shift-P)  
select Remote-containers: Open attached container configuration file  
Copy paste content of devcontainer.json and save  

_TODO_ add config file

## Worflow

### Building the image

From the root of the repo run:

```shell
docker build --pull --rm -f ./.docker/Dockerfile  -t moveit1_ur:latest
```

### Running the image

From the root of the repo run:

```shell
.docker/run_user.sh
```

With Nvidia driver

```shell
.docker/run_user_nvidia.sh
```

### Using the workspace

Take ownership of the workspace with

```shell
sudo chown -R $USER /dev_ws
```

Open vscode, go to the docker tab.
Select the running container, right click and select attach vscode
