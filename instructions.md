# instructions

## build image

```shell
.docker/build_image.sh
```

## run image

```shell
.docker/run_user_nvidia.sh
```

## use

launch moveit and ur config

```shell
roslaunch ur10e_moveit_config demo.launch
```

run trajectory handler

```shell
rosrun trajectory_tools trajectory_handler
```
