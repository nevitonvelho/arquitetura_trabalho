# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Apagando dados antigos..."
Emprestimo.destroy_all
Livro.destroy_all
Categoria.destroy_all
Usuario.destroy_all
Perfil.destroy_all

puts "Criando perfis..."
admin = Perfil.create!(nome: "Administrador", descricao: "Acesso total ao sistema")
comum = Perfil.create!(nome: "Usuário Comum", descricao: "Acesso básico")
bibliotecario = Perfil.create!(nome: "Bibliotecário", descricao: "Gerencia livros e empréstimos")


puts "Criando categorias..."
categorias = [
  Categoria.create!(nome: "Ficção Científica"),
  Categoria.create!(nome: "Romance"),
  Categoria.create!(nome: "História"),
  Categoria.create!(nome: "Tecnologia")
]

puts "Criando livros..."
livros = [
  Livro.create!(titulo: "Duna", autor: "Frank Herbert", editora: "Aleph", ano_publicacao: 1965, isbn: "9788576572002", categoria: categorias[0]),
  Livro.create!(titulo: "Orgulho e Preconceito", autor: "Jane Austen", editora: "Penguin", ano_publicacao: 1813, isbn: "9780141439518", categoria: categorias[1]),
  Livro.create!(titulo: "Sapiens", autor: "Yuval Noah Harari", editora: "Companhia das Letras", ano_publicacao: 2011, isbn: "9788535920427", categoria: categorias[2]),
  Livro.create!(titulo: "Clean Code", autor: "Robert C. Martin", editora: "Prentice Hall", ano_publicacao: 2008, isbn: "9780132350884", categoria: categorias[3])
]

puts "Criando usuários..."
usuarios = [
  Usuario.create!(nome: "Felipe Silva", email: "felipe@example.com", telefone: "11988887777", perfil: admin),
  Usuario.create!(nome: "Luiz Loch", email: "luiz@example.com", telefone: "21999998888", perfil: comum),
  Usuario.create!(nome: "Neviton Velho", email: "neviton@example.com", telefone: "31900009999", perfil: bibliotecario)
]

puts "Criando empréstimos..."
Emprestimo.create!(
  livro: livros[0],
  usuario: usuarios[0],
  data_emprestimo: Date.today - 10,
  data_devolucao_prevista: Date.today,
  data_devolucao_real: nil
)

Emprestimo.create!(
  livro: livros[1],
  usuario: usuarios[1],
  data_emprestimo: Date.today - 20,
  data_devolucao_prevista: Date.today - 10,
  data_devolucao_real: Date.today - 5
)

puts "Seeds finalizados com sucesso!"
