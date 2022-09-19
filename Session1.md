# MRAC II _ Advanced Technology Session 1

## Installation

### Docker installation

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

### IDE

#### vscode (recommended)

Install the following vs code extensions

- [docker](https://code.visualstudio.com/docs/containers/overview)
- [remote development](https://code.visualstudio.com/docs/remote/remote-overview)

dev_container_config for Python development provided in .docker folder

#### pycharm

Install Pycharm using Jetbrains toolbox, once in the container run

```shell
/home/$USER/.local/share/JetBrains/Toolbox/apps/PyCharm-P/ch-0/222.3739.56/bin/pycharm.sh
```

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
