class ProfilesController < ApplicationController


  def profile
    @user = current_user
    @products = @user.products
  end

  def edit
    @user = User.find(params[:id])
    @categories = Category.new
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :address)
  end
end
