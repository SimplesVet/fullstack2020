# SimplesVet fullstack2020

## Instruções
- [Importe esse projeto para sua conta do Github](https://help.github.com/pt/github/importing-your-projects-to-github/importing-a-repository-with-github-importer) como projeto privado e adicione @ssatorres, @matneves e @gwmoura no seu projeto.
- A lista do que fazer está no arquivo [ISSUES.md](./ISSUES.md)

### Ciclo de desenvolvimento
Usamos algo parecido com `Feature Branch`, então:

- Para cada `issue`, é necessário criar uma `branch` a partir da `master`. 
- Ao concluir o desenvolvimento de CADA `issue`, criar um `pull request` e realizar o `merge` através dele.
- Todos os objetos criados ou as modificações realizadas no banco de dados, devem ser colocadas no arquivo `db/1.desafio.sql` OU gere um `dump` do banco ao final do projeto e coloque no mesmo arquivo

## Rodando o projeto
Para rodar o projeto, é preciso ter instalado:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Composer](https://getcomposer.org)
- [Node](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com)

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