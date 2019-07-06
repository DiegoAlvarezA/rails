class Order < ApplicationRecord
  belongs_to :customer
  has_many :linea_items, dependent: :destroy

  def add_product(product)
    current_item = linea_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = linea_items.build(product_id: product.id)
    end
    current_item
  end

  def subtotal
    linea_items.to_a.sum { |item| item.total_price }
  end

  def iva
    subtotal * 16 / 100
  end

  def total
    subtotal + iva
  end

end
