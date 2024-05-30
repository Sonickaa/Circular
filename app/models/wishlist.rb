class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :product_wishlists, dependent: :destroy
  has_many :products, through: :product_wishlists
  #has_many :products, dependent: :destroy
end
