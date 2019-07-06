class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :width
      t.string :height
      t.integer :quantity
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
