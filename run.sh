#!/bin/bash

source /root/projetoCarrinho/devel/setup.bash

# Make the terminal print for us the executed commands
set -x
screen -dmS roscore roslaunch modelo_carrinho gazebo.launch gui:=false

cd /root/gzweb
npm start
