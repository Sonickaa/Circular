class ProductsController < ApplicationController

  def index
    @categories = Category.all
    if params[:category].present?
      @products = Product.where.not(user: current_user).where(category_id: params[:category])
    else
      @products = Product.where.not(user: current_user)
    end
  end

  def show
    @product = Product.find(params[:id])
    #//@wishlist = Wishlist.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.new
  end

  def create
    @product = Product.create(product_params)
    @product.user = current_user
    if @product.save
      redirect_to my_profile_path(@user)
    else
      render :new
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
    user = User.find(params[:user_id])
    product = user.products.find(params[:id])
    offer_product = OfferProduct.where(product_id: product.id)
    offer_product.destroy_all
    product.destroy
    redirect_to request.referer
  end

  def toggle_favorite
    @product = Product.find(params[:id])
    if current_user.wishlist.include?(@product)
      current_user.wishlist.delete(@product)
      favorited = false
    else
      current_user.wishlist << @product
      favorited = true
    end

    if current_user.save
      render json: { success: true, favorited: favorited }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :photo, :category_id, :description, :condition, :price)
  end
end
