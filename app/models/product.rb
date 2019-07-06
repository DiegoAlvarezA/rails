class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_linea_item
  has_many :linea_items
  belongs_to :user, optional: true
  validates :width, :height, presence: true
  validates :price, presence: true, length: { maximum: 7 }
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 8, too_short: "Descripción muy corta" }

# def not_referenced_by_any_linea_item
#   unless linea_items.empty?
#     errors.add(:base, "Hay pedidos con este producto")
#     throw :abort
# end

end
