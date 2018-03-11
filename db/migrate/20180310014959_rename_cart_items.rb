class RenameCartItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :cart_items, :quantity
    add_column :cart_items, :quantity, :integer, default: 1
  end
end
