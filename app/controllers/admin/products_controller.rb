class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice]="Successfully"
    else
      flash[:alert]="failed"
      render :new
    end
  end




  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :avatar)
  end
end
