class CreateLineaItems < ActiveRecord::Migration[5.2]
  def change
    create_table :linea_items do |t|
      t.references :product, foreign_key: true
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
