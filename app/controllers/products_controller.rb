class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(50)
  end

  def add_product_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product) #加product item
    
    redirect_back(fallback_location: root_path)
  end

  def show
    @product = Product.find(params[:id])
  end

end
