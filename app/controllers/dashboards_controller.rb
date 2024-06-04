class DashboardsController < ApplicationController
  def dashboard
  end

  # list of offers current user sent
  def sent

    # @offer_products = OfferProduct.joins(:product, :offer)
    #                               .where(offer: { user_sender: current_user })

    @my_offers = Offer.where(user_sender: current_user)

    ##### better to have a direct query for the product

  end

  # current user can delete sent offers
  def destroyOfferProduct
    @offer_product = Offer_product.find(params[:id])
  end

  # received offers from other users to current user
  def received
    @received_offers = Offer.where(user_receiver_id: current_user.id)
    @new_offer = Offer.new
  end

   # current user must select from other´s users items
  def select
    @offer_products = Offer_product.all
  end

  # current user sends confirmation
  def confirmRecieved
    @offer_products = Offer_product.all
  end

  #  current user can delete received offer
  def destroyRecieved
    @offer_product = Offer_product.find(params[:id])
  end


  # confirmation of sent offer with received offer
  def match
    @offer_products= Offer_product.all
    @products.current_user = Product.find(params[:current_user])
  end

  def destroyMatch

  end

  # users can chat after Match
  def chat
  end

end
