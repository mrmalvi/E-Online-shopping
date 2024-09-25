class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  def after_sign_in_path_for(resource)
    if resource.customer?
      stored_location_for(resource) || users_products_path
    elsif resource.admin? || resource.seller?
      stored_location_for(resource) || admin_dashboard_path
    else
      root_path
    end
  end
end
