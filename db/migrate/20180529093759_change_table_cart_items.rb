class ChangeTableCartItems < ActiveRecord::Migration[5.2]
  def change
    change_table :cart_items do |t|
      t.rename :item_id, :added_item_id

    end
  end
end
