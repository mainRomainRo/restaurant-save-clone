class Item < ApplicationRecord

  validates :title, uniqueness: true
  validates :price, numericality: true
  validates :title, :price, :description, :image_url, presence: true

  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :users, through: :carts

end
