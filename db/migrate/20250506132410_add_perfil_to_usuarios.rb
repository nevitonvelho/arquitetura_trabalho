class AddPerfilToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_reference :usuarios, :perfil, null: false, foreign_key: true
  end
end
