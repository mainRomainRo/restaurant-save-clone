class Order < ApplicationRecord

  belongs_to :user
  has_many :item_orders, dependent: :destroy
  has_many :purchased_items, through: :item_orders, dependent: :destroy

end
