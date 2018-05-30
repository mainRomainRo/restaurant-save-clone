class AddItempicToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_pic, :string
  end
end
