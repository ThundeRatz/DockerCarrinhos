# DockerCarrinhos

Para abrir o Docker:

```bash
docker build -t dockercarrinhos .
docker run -it -p 7681:7681 -p 8080:8080 dockercarrinhos
```

Para abrir um projeto:

```bash
source /root/projetoCarrinho/devel/setup.bash && \    
roslaunch modelo_carrinho gazebo.launch gui:=false
```

e para abrir o gzweb, digite em um novo terminal:

```bash
cd /root/gzweb && npm start
```

Para ver seu projeto, basta entrar em ```http://localhost:8080/```
