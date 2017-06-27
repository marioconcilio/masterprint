class AddSubtipoToPapeis < ActiveRecord::Migration[5.0]
  def change
    add_column :papeis, :subtipo, :string
  end
end
