json.extract! emprestimo, :id, :livro_id, :usuario_id, :data_emprestimo, :data_devolucao_prevista, :data_devolucao_real, :created_at, :updated_at
json.url emprestimo_url(emprestimo, format: :json)
