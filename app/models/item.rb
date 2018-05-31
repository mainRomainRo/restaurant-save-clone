class Item < ApplicationRecord

  validates :title, uniqueness: true
  validates :price, numericality: true
  validates :title, :price, :description, presence: true

  has_many :cart_items, foreign_key: :added_item_id, dependent: :destroy
  has_many :carts, through: :cart_items, dependent: :destroy

  has_many :users, through: :carts, dependent: :destroy

  has_many :item_orders, foreign_key: :purchased_item_id, dependent: :destroy
  has_many :orders, through: :item_orders, dependent: :destroy

  has_many :users, through: :orders, dependent: :destroy

  attr_accessor :item_pic

  mount_uploader :item_pic, ItemPicUploader

end
