class CreateRecados < ActiveRecord::Migration[5.0]
  def change
    create_table :recados do |t|
      t.string :titulo
      t.text :texto
      t.integer :remetente_id
      t.integer :destinatario_id

      t.timestamps
    end

    add_index 'recados', ['remetente_id'], name: "idx_recados_on_remetente_id", using: :btree
    add_index 'recados', ['destinatario_id'], name: "idx_recados_on_destinatario_id", using: :btree
  end
end
