# MRAC II _ Advanced Technology Session 1

## Connection to the robot

In order to ensure optimal performance of the ur_driver without the realtime kernel the ur_robot-driver is run with a high priority.

See process [nice](https://en.wikipedia.org/wiki/Nice_(Unix)) for more information

This requires the user to have the permissions to change the niceness of processes.

Add the following to /etc/security/limits.conf on the Docker host

`$USER - nice -15`

When inside the container run

```shell
su $USER
```

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
