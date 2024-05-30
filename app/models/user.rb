class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_offers,
           class_name: "Offer",
           foreign_key: "user_sender_id", dependent: :destroy
  has_many :received_offers,
           class_name: "Offer",
           foreign_key: "user_receiver_id", dependent: :destroy

  has_one :wishlist, dependent: :destroy
  #has_many :products, through: :wishlist
end
