class AddTitleToMassages < ActiveRecord::Migration[5.2]
  def change
    add_column :massages, :title, :string
  end
end
