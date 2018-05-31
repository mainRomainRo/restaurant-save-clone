class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :added_items, through: :cart_items, dependent: :destroy

end
