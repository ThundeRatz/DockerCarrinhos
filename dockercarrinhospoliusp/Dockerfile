# derived from http://github.com/osrf/docker_images/blob/master/gazebo/gazebo7/gzweb7/Dockerfile
# install ros packages
FROM osrf/ros:noetic-desktop-focal

#install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*

# install packages
RUN apt update -y && apt install -q -y \
    build-essential \
    cmake \
    imagemagick \
    libboost-all-dev \
    libgts-dev \
    libjansson-dev \
    libtinyxml-dev \
    mercurial \
    pkg-config \
    psmisc \
    xvfb \
    curl \
    git \
    screen \
    ros-noetic-velocity-controllers python-pygame \
    libgazebo11-dev=11.3.0-1* \
    && rm -rf /var/lib/apt/lists/*

# install node v12.x
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update && apt install -q -y nodejs nodejs-legacy \
    && rm -rf /var/lib/apt/lists/*
