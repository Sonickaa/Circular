class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo
  has_many :offer_products, dependent: :destroy
  belongs_to :wishlist, optional: true
  has_many :product_wishlists, dependent: :destroy
end
