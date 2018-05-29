class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :added_item, class_name: "Item", foreign_key: :added_item_id
end
