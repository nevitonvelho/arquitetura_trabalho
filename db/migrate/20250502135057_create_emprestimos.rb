class CreateEmprestimos < ActiveRecord::Migration[7.1]
  def change
    create_table :emprestimos do |t|
      t.references :livro, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true
      t.date :data_emprestimo
      t.date :data_devolucao_prevista
      t.date :data_devolucao_real

      t.timestamps
    end
  end
end
