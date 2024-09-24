module Admin
  class BaseController < ApplicationController
    before_action :user_authenticate!
  end
end
