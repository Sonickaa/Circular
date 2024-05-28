class Offer < ApplicationRecord
  belongs_to :user_sender, class_name: 'User'
  belongs_to :user_receiver, class_name: 'User'
end
