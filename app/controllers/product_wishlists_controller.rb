class ProductWishlistsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @product_whishlist = ProductWishlist.new(wishlist: current_user.wishlist, product: @product)

    if @product_whishlist.save
      redirect_to wishlist_path(@current_user.wishlist)
    else
      redirect_to products_path
    end
  end

  def destroy
    @product_whishlist = ProductWishlist.where(wishlist_id: params[:wishlist_id],product_id: params[:id])
    @product_whishlist[0].destroy
    redirect_to request.referer
  end
end
