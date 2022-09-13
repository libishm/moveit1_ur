# MRAC II _ Advanced Technology Session 1

## Installation

### Docker installation

Follow instructions from Docker [docs](https://docs.docker.com/engine/install/ubuntu/)

To enable Docker to use Nvidia driver (Nvidia driver is not compatible with preempt_rt kernel) follow instructions from Nvidia [docs](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

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

#### git

_TODO_

remove submodules and merge into single repo
