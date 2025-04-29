# Arquitetura De Software - Atividade MVP

Este projeto utiliza Docker para configurar o ambiente de desenvolvimento com PostgreSQL e Ruby on Rails.
O propósito esta atividade é criar um gerenciador de biblioteca usando a arquitetura MVP.

# Pré-requisitos:
- Docker instalado
- Docker Compose instalado

# Para construir as imagens e iniciar os containers:

```
docker compose up --build -d
```

Isso irá:

- Criar o *container* do banco de dados (db)
- Criar o *container* da aplicação Rails (web)
- Fazer o *bind* das portas para acesso local


## Criar o banco de dados

Após os *containers* estarem rodando, execute:

```
docker compose exec web ./bin/rails db:create
```

Este comando cria o banco de dados PostgreSQL definido no seu `config/database.yml`.


## Rodar as migrations

Com o banco criado, rode as migrations para criar as tabelas:

```
docker compose exec web ./bin/rails db:migrate
```

Se quiser popular o banco (caso tenha seeds):

```
docker compose exec web ./bin/rails db:seed
```

Acessar a aplicação

Depois que tudo estiver pronto, acesse o navegador:

http://localhost:3000


## Dicas

Para rodar comandos Rails dentro do container:
```
docker compose exec web ./bin/rails <comando>
```

Exemplos:
```
docker compose exec web ./bin/rails console
docker compose exec web ./bin/rails db:migrate
docker compose exec web ./bin/rails g scaffold User name:string email:string
```

Para resetar tudo (containers, volumes e imagens):
