class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :payment_status
      t.integer :sn
      t.integer :amount
      t.string :shipping_status

      t.timestamps
    end
  end
end
