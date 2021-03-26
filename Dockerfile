# derived from http://github.com/osrf/docker_images/blob/master/gazebo/gazebo7/gzweb7/Dockerfile
# install ros packages
FROM osrf/ros:noetic-desktop-full
WORKDIR /root/ros/


RUN apt-get update && apt-get install -q -y ros-noetic-hector-gazebo-plugins
RUN apt-get update && apt install -y ros-noetic-velocity-controllers python-pygame
# RUN apt-get update && apt-get install git -y


FROM gazebo:libgazebo11-bionic
WORKDIR /root/
COPY --from=0 root/ros/ .

# install packages
RUN apt-get update && apt-get upgrade -y && apt-get install -q -y \
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
    && rm -rf /var/lib/apt/lists/*

# install gazebo packages
RUN apt-get update && apt-get install -q -y \
    curl \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -q -y nodejs nodejs-legacy \
    libgazebo11-dev=11.3.0-1* \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install git -y
# clone gzweb
RUN cd ~; \
    git clone https://github.com/osrf/gzweb
RUN cd ~/gzweb \
    git checkout gzweb_1.4.0 \
    ./deploy.sh -m

# setup environment
EXPOSE 8080
EXPOSE 7681

# make a missing folder
CMD mkdir /root/gzweb/http/client/assets
# download models & assets
# CMD cd /root/gzweb && ./deploy.sh -m -t
# CMD cd ~ && \
#     mkdir projetoCarrinho && \
#     cd projetoCarrinho && \
#     mkdir src && \
#     cd src && \
#     git clone https://github.com/ThundeRatz/gazebo_modelo_carrinho.git && \
#     cd ~/projetoCarrinho/ &&\
#     catkin_make

#CMD GAZEBO_MODEL_PATH=projetoCarrinho roslaunch roslaunch modelo_carrinho gazebo.launch gui:=false

# run gzserver and gzweb
#CMD cd /root/gzweb && ./start_gzweb.sh && npm start
#CMD gzserver
