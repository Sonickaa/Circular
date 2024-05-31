class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :find_or_create_my_wishlist
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :address])
  end

  def find_or_create_my_wishlist
    if current_user
      if current_user.wishlist
        @wishlist = current_user.wishlist
      else
        @wishlist = Wishlist.create(user_id: current_user.id)
      end
    end
  end
end
