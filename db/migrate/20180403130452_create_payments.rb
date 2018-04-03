class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :sn
      t.integer :amount
      t.string :payment_method
      t.datetime :paid_at
      t.text :params
      t.integer :order_id

      t.timestamps
    end

    add_column :orders, :user_id, :integer
    add_column :orders, :payment_id, :integer
  end
end
