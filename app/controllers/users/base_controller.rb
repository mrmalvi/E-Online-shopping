module Users
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_customer!

    def ensure_customer!
      if !current_user.customer?
        sign_out current_user
        redirect_to new_user_session_path
      end
    end
  end
end
