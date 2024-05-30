class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :photo

  belongs_to :wishlist, optional: true
end
