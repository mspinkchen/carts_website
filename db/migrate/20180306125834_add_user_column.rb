class AddUserColimn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, default: 'normal'
  end
end
