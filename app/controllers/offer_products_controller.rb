class OfferProductsController < ApplicationController
  def index
    @offer_products = OfferProduct.all
  end
end
