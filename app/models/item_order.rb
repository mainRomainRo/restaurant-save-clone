class ItemOrder < ApplicationRecord
  belongs_to :purchased_item, class_name: "Item", foreign_key: :purchased_item_id
  belongs_to :order
end
