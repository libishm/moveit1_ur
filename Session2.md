# MRAC II _ Advanced Technology Session 1

## Connection to the robot

In order to ensure optimal performance of the ur_driver without the realtime kernel the ur_robot-driver is run with a high priority.

See process [nice](https://en.wikipedia.org/wiki/Nice_(Unix)) for more information

This requires the user to have the permissions to change the niceness of processes.

Add the following to /etc/security/limits.conf on the Docker host

```
$USER - nice -15
```

When inside the container run

```
su $USER
```
