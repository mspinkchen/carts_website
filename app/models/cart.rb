class Cart < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_cart_item(product) 
    # 1 -> n
    existing_item = self.cart_items.find_by(product_id: product)
    if existing_item
      existing_item += 1
      existing_item.save!
    else
    # 0 -> 1
    cart_item = cart_items.build(product_id: product.id)
    cart_item.save!
    end
    self.cart_items
  end

end
