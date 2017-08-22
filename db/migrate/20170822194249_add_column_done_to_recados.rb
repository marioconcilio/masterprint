class AddColumnDoneToRecados < ActiveRecord::Migration[5.0]
  def change
    add_column :recados, :done, :boolean, default: false
  end
end
