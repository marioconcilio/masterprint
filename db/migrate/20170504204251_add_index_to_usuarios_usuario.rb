class AddIndexToUsuariosUsuario < ActiveRecord::Migration[5.0]
  def change
    add_index :usuarios, :usuario, unique: true
  end
end
