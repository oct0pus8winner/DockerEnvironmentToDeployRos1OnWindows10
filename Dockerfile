FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# update
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# install
RUN apt-get update \
    && apt-get -y install \
    build-essential \
    curl \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > etc/apt/sources.list.d/ros-latest.list' 
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add \
    && apt-get update \
    && apt-get install -y \
    ros-noetic-desktop-full \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc source ~/.bashrc


RUN apt-get update \
    && apt-get install -y\
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool\
    && rm -rf /var/lib/apt/lists/*

RUN rosdep init 
RUN rosdep update

WORKDIR /app/

CMD ["bash"]