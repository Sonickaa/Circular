class WishlistsController < ApplicationController
  def show
    @wishlist = current_user.wishlist
  end

  def destroy
    @product_wishlist = Product_wishlist.find(params[:id])
    @product_wishlist.destroy
    redirect_to dashboard_path, notice:'Product was successfully removed from wishlist.'
  end
end
