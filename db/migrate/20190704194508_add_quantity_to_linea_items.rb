class AddQuantityToLineaItems < ActiveRecord::Migration[5.2]
  def change
    add_column :linea_items, :quantity, :integer, default: 1
  end
end
