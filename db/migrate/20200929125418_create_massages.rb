class CreateMassages < ActiveRecord::Migration[5.2]
  def change
    create_table :massages do |t|
      t.string :content

      t.timestamps
    end
  end
end
