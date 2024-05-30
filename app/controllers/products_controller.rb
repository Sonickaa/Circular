class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @whishlist = Wishlist.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render “new”
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :photo, :category, :description, :condition, :price)
  end

end
