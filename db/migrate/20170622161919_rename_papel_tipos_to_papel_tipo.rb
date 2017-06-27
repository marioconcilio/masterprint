class RenamePapelTiposToPapelTipo < ActiveRecord::Migration[5.0]
  def change
    rename_column :papeis, :papel_tipos_id, :papel_tipo_id
  end
end
