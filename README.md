
# Docker Moveit 1 and Universal Robots

## Description

Contents:

- Moveit 1

  - IK
    - KDL
    - TRAC-IK

  - Planning pipelines
    - OMPL
    - CHOMP
    - STOMP
    - Pilz Industrial Motion Planner

- Universal Robot description and driver

  Note: Only the ur10e_moveit_config has been updated, in case you want use this repo with a different UR robot you will need to update the corresponding moveit_config.
  To update ur(x)_moveit_config

  - Use the setup assistant to regenerate pkg
  - Set acceleration_limits to true and set max_acc in config/joint_limits.yaml
  - Add STOMP pipeline to move_group.launch

- RQT joint trajectory plot

## Docker



## Moveit

### Running in simulation

```shell
roslaunch ur10e_moveit_config demo.launch
```

### Running on the robot

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

_Note_ This launch (using launch-prefix) file will set the the niceness of the ur_robot_driver to -15. This to ensure optimal performance without the realtime kernel.

```shell
roslaunch ur10e_moveit_config ur10e_moveit_planning_execution.launch
```
