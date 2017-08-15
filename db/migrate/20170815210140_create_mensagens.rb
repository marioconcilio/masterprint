class CreateMensagens < ActiveRecord::Migration[5.0]
  def change
    create_table :mensagens do |t|
      t.string :titulo
      t.text :texto
      t.integer :remetente_id
      t.integer :destinatario_id

      t.timestamps
    end

    add_index 'mensagens', ['remetente_id'], name: "index_mensagens_on_remetente_id", using: :btree
    add_index 'mensagens', ['destinatario_id'], name: "index_mensagens_on_destinatario_id", using: :btree
  end
end
