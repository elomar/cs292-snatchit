class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sale_id]
      @sale = Sale.find(params[:sale_id])
      @products = @sale.products
    else
      @products = Product.all
    end
  end

  def show
  end

  def new
    @product = current_sale.products.new
  end

  def edit
  end

  def create
    @product = current_sale.products.new(product_params)

    if @product.save
      redirect_to sale_products_path(current_sale), notice: 'Product was successfully created.' 
    else
      render action: 'new' 
    end
  end

  def update
    if @product.update(product_params)
      redirect_to sale_products_path(current_sale), notice: 'Product was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @product.destroy
    redirect_to sale_products_path(current_sale)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = current_sale.products.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :url)
  end

  def current_sale
    current_user.sale
  end
end
