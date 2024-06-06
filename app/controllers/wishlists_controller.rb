class WishlistsController < ApplicationController
  def show
    @wishlist = current_user.wishlist
  end

  def destroy
    @product_wishlist = Product_wishlist.find(params[:id])
    @product_wishlist.destroy
    redirect_to wishlist_path(current_user.wishlist.id)
  end
end
