class CreateFornecedores < ActiveRecord::Migration[5.0]
  def change
    create_table :fornecedores do |t|
      t.bigint :ie
      t.string :razao_social
      t.string :email
      t.string :endereco
      t.string :cidade
      t.string :uf
      t.integer :cep
      t.string :telefone
      t.string :celular
      t.string :nome
      t.string :contato
      t.string :email

      t.timestamps
    end
  end
end
