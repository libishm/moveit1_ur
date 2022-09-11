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
    iputils-ping \
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
    ros-$ROSDISTRO-trac-ik-kinematics-plugin \
    # UR dependencies
    ros-$ROSDISTRO-ur-client-library \
    ros-$ROSDISTRO-ur-msgs \
    ros-$ROSDISTRO-controller-manager \
    ros-$ROSDISTRO-pass-through-controllers \
    ros-$ROSDISTRO-force-torque-sensor-controller \
    ros-$ROSDISTRO-industrial-robot-status-interface \
    ros-$ROSDISTRO-industrial-robot-status-controller \
    ros-$ROSDISTRO-joint-state-controller \
    ros-$ROSDISTRO-joint-trajectory-controller \
    ros-$ROSDISTRO-cartesian-trajectory-controller \
    ros-$ROSDISTRO-scaled-joint-trajectory-controller \
    ros-$ROSDISTRO-speed-scaling-interface \
    ros-$ROSDISTRO-speed-scaling-state-controller \
    ros-$ROSDISTRO-velocity-controllers \
    ros-$ROSDISTRO-effort-controllers \
    ros-$ROSDISTRO-kdl-parser \
    # RQT joint trajectory plot
    ros-$ROSDISTRO-roslint \
    ros-$ROSDISTRO-rqt-gui \
    ros-$ROSDISTRO-rqt-gui-py \
    ros-$ROSDISTRO-rqt-py-common \
    python3-matplotlib \
    #STOMP
    ros-$ROSDISTRO-ros-industrial-cmake-boilerplate 

# Reduce size by removing apt cache
RUN ["/bin/bash", "-c", "rm -rf /var/lib/apt/lists/*"]

RUN echo "* - nice -15" >> /etc/security/limits.conf

# build STOMP dependencie nlot
RUN ["/bin/bash", "-c", "git clone https://github.com/stevengj/nlopt.git &&\
                        cd nlopt &&\
                        mkdir build &&\
                        cd build &&\
                        cmake .. &&\
                        make &&\
                        make install"]


# Create workspace and copy pkg's to container
RUN mkdir -p dev_ws/src
WORKDIR /dev_ws/src
COPY . /dev_ws/src/


# build workspace
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