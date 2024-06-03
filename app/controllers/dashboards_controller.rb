class DashboardsController < ApplicationController
  def dashboard
  end
  
  def index
    @pending_products = current_user.products.where(status: 'pending')
  end
end
