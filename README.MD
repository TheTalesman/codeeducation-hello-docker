# Hello Docker

Hello Docker é um dos desafios do curso "Aplicações Modernas e Escaláveis com Microsserviços 2.0" da code education. 
Contempla a build de uma imagem docker com menos de 2 MB (nesse caso 566.24 KB)
Para isso foi utilizada a imagem golang alpine como container para geração da build go em um multi stage, sendo a build copiada para a imagem scratch. 
Alguns paramêtros da build go também foram utilizados para redução de tamanho, e um usuário criado para exectuar essa build com um exemplo de Hello World.

## Docker Hub Image
https://hub.docker.com/repository/docker/thetalesman/codeeducation

## Running
```docker run thetalesman/codeeducation```
