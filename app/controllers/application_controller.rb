class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  helper_method :current_shopping_cart

  def after_sign_in_path_for(resource)
    if resource.customer?
      stored_location_for(resource) || users_products_path
    elsif resource.admin? || resource.seller?
      stored_location_for(resource) || admin_dashboard_path
    else
      root_path
    end
  end

  def current_shopping_cart
    @current_shopping_cart ||= if current_user
      current_user.customer_shopping_cart
    end
  end
end
