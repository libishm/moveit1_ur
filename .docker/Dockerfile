ARG ROSDISTRO=noetic

FROM ros:$ROSDISTRO-robot

ARG ROSDISTRO

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

ENV TERM xterm-256color

# Tools
RUN apt update && apt install -y \
    ssh \
    git \
    terminator \
    python3-pip \
    build-essential \
    cmake \
    zsh 

# ROS
RUN apt update && apt install -y \
    pkg-config \
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall-generator \
    python3-vcstool \
    ros-$ROSDISTRO-rqt \
    ros-$ROSDISTRO-rqt-joint-trajectory-controller \
    ros-$ROSDISTRO-moveit \
    ros-$ROSDISTRO-moveit-opw-kinematics-plugin \
    ros-$ROSDISTRO-ros-industrial-cmake-boilerplate



# Reduce size by removing apt cache
RUN ["/bin/bash", "-c", "rm -rf /var/lib/apt/lists/*"]

RUN pip3 install catkin_tools

# Create workspace and copy pkg's to container
RUN mkdir -p dev_ws/src
WORKDIR /dev_ws/src
COPY . /dev_ws/src/

# Build workspace
WORKDIR /dev_ws
RUN ["/bin/bash", "-c", "source /opt/ros/$ROSDISTRO/setup.bash &&\
    catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release &&\
    catkin build \
    "]



RUN ["/bin/bash", "-c", "cp /dev_ws/src/.docker/entrypoint.sh / && chmod 777 /entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh" ]

# Bash
# CMD ["bash"]\

# ZSH
# Set shell to zsh
SHELL ["zsh", "chsh -s ~/.zshrc" ]
CMD ["zsh"]