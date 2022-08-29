#!/bin/zsh
# Adjust shebang for bash
set -e

# setup ros environment

# bash
#source "/opt/ros/noetic/setup.bash"
#source "/dev_ws/devel/setup.bash"

# zsh
source "/opt/ros/noetic/setup.zsh"
source "/dev_ws/devel/setup.zsh"

exec "$@"