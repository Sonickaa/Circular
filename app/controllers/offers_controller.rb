class OffersController < ApplicationController
  def index
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    # creating offer and linking it to the product and all

    @product = Product.find(params[:product_id])
    @offer = Offer.new(user_sender: current_user, user_receiver: @product.user)

    OfferProduct.create(offer: @offer, product: @product)
    # current_user.products.each do |product|
    #   OfferProduct.create(offer: @offer, product: product)
    # end

    @offer.save
    redirect_to products_path
  end

  def create_counter_offer
    raise
    @product = Product.find(params[:offer][:their_product])

    @offer = Offer.new(user_sender: @product.user, user_receiver: current_user )

    OfferProduct.create(offer: @offer, product: @product)
  end
end
