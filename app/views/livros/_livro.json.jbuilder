json.extract! livro, :id, :titulo, :autor, :editora, :ano_publicacao, :isbn, :categoria_id, :created_at, :updated_at
json.url livro_url(livro, format: :json)
