# derived from http://github.com/osrf/docker_images/blob/master/gazebo/gazebo7/gzweb7/Dockerfile
# install ros packages
FROM osrf/ros:noetic-desktop-focal

# install packages
RUN apt update && apt upgrade -y && apt install -q -y \
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
    ros-noetic-velocity-controllers python-pygame \
    libgazebo11-dev=11.3.0-1* \
    && rm -rf /var/lib/apt/lists/*

# install node v12.x
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt update && apt install -q -y nodejs nodejs-legacy \
    && rm -rf /var/lib/apt/lists/*

################
# clone and setup project
RUN cd ~ &&  \
    mkdir -p ./projetoCarrinho/src && \
    cd ./projetoCarrinho/src && \
    git clone --branch feature/gzweb https://github.com/ThundeRatz/gazebo_modelo_carrinho.git && \
    cd ~/projetoCarrinho/ && \
    . /opt/ros/noetic/setup.sh && \
    catkin_make

RUN . /usr/share/gazebo/setup.sh

ENV GAZEBO_MODEL_PATH /usr/share/gazebo-11/models:~/projetoCarrinho/src/gazebo_modelo_carrinho/models
ENV GAZEBO_RESOURCE_PATH /usr/share/gazebo-11:~/projetoCarrinho/src/gazebo_modelo_carrinho

# clone gzweb
RUN cd ~ && \
    git clone --branch feature/split https://github.com/FelipeGdM/gzweb.git &&  \
    cd ~/gzweb && \
    npm install && \
    mkdir -p build && \
    npm run update && \
    GAZEBO_MODEL_PATH=~/projetoCarrinho/src/gazebo_modelo_carrinho/models ./deploy.sh -m local

# setup environment
EXPOSE 8080
EXPOSE 7681
