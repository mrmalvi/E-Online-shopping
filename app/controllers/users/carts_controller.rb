module Users
  class CartsController < BaseController
    def show
      @cart = current_shopping_cart
      @line_items = @cart.line_items
    end
  end
end
