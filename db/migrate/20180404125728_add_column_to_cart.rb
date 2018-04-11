class AddColumnToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :uid, :integer
  end
end
