# instructions

## build image

```shell
.docker/build_image.sh
```

_note_ ur_kinematics will throw warnings during build

## run image

```shell
.docker/run_user_nvidia.sh
```

## use

_note_ terminator is installed in the container

launch moveit and ur config

```shell
roslaunch ur10e_moveit_config demo.launch
```

run trajectory handler

```shell
rosrun trajectory_tools trajectory_handler
```
