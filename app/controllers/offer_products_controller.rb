class OfferProductsController < ApplicationController
  def index
   @offer_products = Offer_product.all
  end
end
