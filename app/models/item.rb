class Item < ApplicationRecord

  validates :title, uniqueness: true
  validates :price, numericality: true
  validates :title, :price, :description, :image_url, presence: true

end
