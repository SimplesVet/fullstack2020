# SimplesVet fullstack2020

## Instruções
- Faça um fork privado do projeto e adicione @ssatorres, @matneves e @gwmoura no seu projeto.
- Para cada issue, é necessário criar uma branch a partir da master. 
- Ao concluir o desenvolvimento de uma issue, realizar um merge a partir de um pull request.
- Todos os objetos criados ou as modificações realizadas no banco de dados, devem ser colocadas no arquivo `db/1.desafio.sql`
- A execução deve seguir a ordem de priorização na lista de To do. 

## Rodando o projeto
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

Para acessar o banco, use o `client` que desejar (MySQL Workbench, TablePlus, PHPMyAdmin, etc) e as credenciais estão no arquivo `.env`.