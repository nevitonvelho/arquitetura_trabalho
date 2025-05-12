# Arquitetura De Software - Atividade MVC

Este projeto utiliza Docker para configurar o ambiente de desenvolvimento com PostgreSQL e Ruby on Rails.
O propósito esta atividade é criar um gerenciador de biblioteca usando a arquitetura MVC.

## Pré-requisitos:
- Docker instalado
- Docker Compose instalado

## Para construir as imagens e iniciar os containers:

```
docker compose up --build -d
```

Isso irá:

- Criar o *container* do banco de dados (db)
- Criar o *container* da aplicação Rails (web)
- Criar um volume para armazenar de forma permanentemente os dados do banco de dados
- Fazer o *bind* das portas para acesso local
- Criar as tabelas no banco de dados
- Fazer a *migration* das modificações do banco de dados
- Fazer o *seed* do banco de dados


Acessar a aplicação

Depois que tudo estiver pronto, acesse o navegador:

http://localhost:3000

## Para destruir o que foi criado

Para apagar toda a aplicação, junto com o volume e imagens criado, use o comando abaixo:

```
docker compose down --rmi all -v
```


### Dicas

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
