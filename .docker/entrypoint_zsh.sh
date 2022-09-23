#!/bin/zsh

set -e

# setup ros environment
source "/opt/ros/noetic/setup.zsh"
source "/dev_ws/devel/setup.zsh"

# Launch Kitty
 ../../home/v/.local/kitty.app/bin/kitty

exec "$@"