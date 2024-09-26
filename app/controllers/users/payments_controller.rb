module Users
  class PaymentsController < BaseController


    def create
      current_shopping_cart.line_items
    end

  end
end
