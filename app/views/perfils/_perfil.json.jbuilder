json.extract! perfil, :id, :nome, :descricao, :created_at, :updated_at
json.url perfil_url(perfil, format: :json)
