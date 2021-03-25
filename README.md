# DockerCarrinhos
Para abrir o Docker:
```
docker build -t dockercarrinhos .
docker run -it -p 7681:7681 -p 8080:8080 dockercarrinhos /bin/bash
```
Para abrir o gzweb:
```
cd /root/gzweb && ./start_gzweb.sh && npm start
gzserver
```
Para abrir um projeto:
```
cd ~; && \
    mkdir projetoCarrinho && \
    cd projetoCarrinho && \
    mkdir src && \
    cd src && \
    git clone https://github.com/ThundeRatz/gazebo_modelo_carrinho.git && \
    cd /projetoCarrinho/ &&\
    catkin_make
    
GAZEBO_MODEL_PATH=projetoCarrinho roslaunch roslaunch modelo_carrinho gazebo.launch gui:=false
```
