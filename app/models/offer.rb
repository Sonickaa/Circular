class Offer < ApplicationRecord
  belongs_to :user_sender, class_name: 'User'
  belongs_to :user_receiver, class_name: 'User'
  has_many :offer_products
  has_many :products, through: :offer_products
  enum status: [ :pending, :matched, :completed]
end
