# Issues

Aqui está a lista de coisas que devem ser feitas! Ela já está ordenada na sequência que deve ser desenvolvida e essa **sequência deve ser respeitada**.

Usamos Kanban pra tudo, então se ligue: **Uma coisa de cada vez, até o fim, o mais rápido possível!**

Indico que você use o próprio `Projects` do Github para gerenciar as tarefas. É simples, e a gente conseque acompanhar daqui

## 1 - Erro ao remover um cliente
Quando tento remover um cliente, nada acontece... =(

## 2 - Adicionar campo de telefone nos formulários de inclusão e atualização de Clientes
O desenvolvedor que estava com essa tela, está de férias e esqueceu de adicionar o campo de telefone na tela de Clientes.

- Regras
    - A tabela de cliente já possui campo de telefone, mas não tem na tela ainda... =/
    - É preciso adicionar o campo tanto na inclusão quanto na edição.
    - Esse campo precisa de máscara para celular

## 3 - Adicionar campo de Data de Nascimento no Cadastro de Clientes
Para que possamos mandar mensagem de aniverário pra o cliente, precisamos da informação do nascimento.

- Regras
    - É preciso criar um campo novo na tabela, alterar a `view` e `procedures` para contemplar esse novo campo
    - Crie uma função no `banco de dados` chamada `fn_idade(data_nascimento)` que recebe uma data, calcula o tempo até hoje e retorna `quantos anos` a pessoa tem.
    - Essa função deve ser usada na view de clientes, que vai ter um `alias` chamado `idade`.
    - É necessário que o campo tenha um `date picker` para facilitar o preenchimento na tela
    - Deve ser exibida a `idade` do cliente na listagem como uma nova coluna.

## 4 - Criar tabela, view e endpoints de espécie
Essa tabela é importante e será usada no cadastro de animais... 

- Campos:
    - id
    - nome
- Regras: 
    - Crie `tabela`, `view` e o `GET /racas` na API
    - Não precisa de tela de cadastro (CRUD)
    - Pode incluir alguns registros direto no banco como Canina, Felina, etc.

## 5 - Criar tela para cadastro de animais
A tela de Animais vai ser semelhante à de Clientes, porém com alguns campos diferentes.

- Campos: 
    - id
    - nome
    - cliente (fk - chave estrangeira)
    - espécie (fk - chave estrangeira)
- Regras:
    - É preciso criar uma `tabela`, `view`, `procedures` para `ins`, `upd` e `delete`
    - Também deve-se criar os endpoints na API, assim como o de `clientes`
    - Necessário criar interface para listar, cadastrar, atualizar e excluir (CRUD)
    - Os campos `cliente` e `especie` devem ser um `combobox` de seleção única.
    - Obs: Um cliente pode ter mais de um animal

## 6 - O click no cliente não funciona em toda a área da linha
Segue vídeo com o comportamento:

![erro](https://user-images.githubusercontent.com/1444980/76023432-ef27e380-5f07-11ea-8ed9-cff0b3a6f3bf.gif)
