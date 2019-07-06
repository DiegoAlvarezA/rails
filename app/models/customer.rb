class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :linea_items
  validates :names, presence: true
  validates :surnames, presence: true
  validates :email, presence: true
end
