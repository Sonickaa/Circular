class OfferProduct < ApplicationRecord
  belongs_to :offer
  belongs_to :product
end

class Product < ApplicationRecord
  has_one_attached :image
end
