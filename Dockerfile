FROM thunderatz/carrinho_deps:latest


# clone and setup project
RUN cd ~ &&  \
    mkdir -p ./projetoCarrinho/src && \	
    cd ./projetoCarrinho/src && \	
    git clone https://github.com/ThundeRatz/gazebo_modelo_carrinho.git && \	
    cd ~/projetoCarrinho/ && \	
    . /opt/ros/noetic/setup.sh && \
    catkin_make

RUN . /usr/share/gazebo/setup.sh

ENV GAZEBO_MODEL_PATH /usr/share/gazebo-11/models:~/projetoCarrinho/src/gazebo_modelo_carrinho/models
ENV GAZEBO_RESOURCE_PATH /usr/share/gazebo-11:~/projetoCarrinho/src/gazebo_modelo_carrinho

# clone gzweb
RUN cd ~ && \
    git clone https://github.com/FelipeGdM/gzweb.git &&  \
    cd ~/gzweb && \
    npm install && \
    mkdir -p build && \
    npm run update && \
    GAZEBO_MODEL_PATH=~/projetoCarrinho/src/gazebo_modelo_carrinho/models ./deploy.sh -m local

# setup environment
EXPOSE 8080
EXPOSE 7681

COPY run.sh ~/run.sh

CMD ["bash", "~/run.sh"]
