# DockerCarrinhos
Para abrir o Docker:
```
docker build -t dockercarrinhos .
docker run -it -p 7681:7681 -p 8080:8080 meuprojetocarrinho /bin/bash
```
Para abrir um projeto:
```
cd /root/projetoCarrinho &&\
source devel/setup.bash && \    
roslaunch modelo_carrinho gazebo.launch gui:=false
```
e para abrir o gzweb, digite em um novo terminal:
```
cd /root/gzweb && npm start
```

Para ver seu projeto, basta entrar em ```http://localhost:8080/```.