class Order < ApplicationRecord
  validates_presence_of :name, :phone, :address
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  
end
