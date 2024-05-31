class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_in_path_for(resource)
    Wishlist.create(user: resource)

  end
end
