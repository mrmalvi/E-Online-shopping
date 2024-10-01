module Users
  class OrdersController < BaseController
    skip_before_action :verify_authenticity_token, only: [:create]

    def show
    end

    def index
      @orders = current_user.orders
      @line_items = current_shopping_cart.line_items
    end
  end
end
