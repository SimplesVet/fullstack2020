# SimplesVet fullstack2020

Para rodar o projeto, é preciso ter instalado:
- Docker
- Composer
- Node
- Yarn

Para iniciar: 

Abra 2 janelas (ou abas) do terminal na raiz do projeto e execute os seguintes passos: 

Na primeira: 
```
$ cd app/
$ yarn install
$ yarn serve
```

Na segunda:
```
$ cd api/
$ composer install
$ cd ../
$ docker-compose up
``` 
_Obs: O `docker-compose up` pode demorar alguns minutos_

Pronto! O ambiente já está rodando e pode ser acessado via browser no `http://localhost:8080/` e a API em `http://localhost/clientes`.

Para acessar o banco, use o `client` que desejar (MySQL Workbench, TablePlus, PHPMyAdmin, etc) e as credencias estão no arquivo `.env`.
