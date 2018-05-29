class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_items
  has_many :added_items, through: :cart_items
  
end
