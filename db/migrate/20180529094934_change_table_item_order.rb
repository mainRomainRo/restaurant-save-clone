class ChangeTableItemOrder < ActiveRecord::Migration[5.2]
  def change
      change_table :item_orders do |t|
        t.rename :item_id, :purchased_item_id
      end
  end
end
