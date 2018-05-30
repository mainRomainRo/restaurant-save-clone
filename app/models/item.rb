class Item < ApplicationRecord

  validates :title, uniqueness: true
  validates :price, numericality: true
  validates :title, :price, :description, :image_url, presence: true

  has_many :cart_items, foreign_key: :added_item_id
  has_many :carts, through: :cart_items

  has_many :users, through: :carts

  has_many :item_orders, foreign_key: :purchased_item_id
  has_many :orders, through: :item_orders

  has_many :users, through: :orders

  attr_accessor :item_pic

  mount_uploader :item_pic, ItemPicUploader

end
