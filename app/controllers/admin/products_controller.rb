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
      redirect_to admin_products_path
    else
      flash[:alert]="failed"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice]= "Successfully updated"
      redirect_to admin_products_path
    else
      render :edit
      flash[:notice]= @product.errors.full_messages.to_sentence
    end
  end




  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :avatar)
  end
end
