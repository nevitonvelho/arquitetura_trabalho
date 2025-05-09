class CreateLivros < ActiveRecord::Migration[7.1]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :autor
      t.string :editora
      t.integer :ano_publicacao
      t.string :isbn
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
