module Users
  class CartsController < BaseController
    def show
      @cart = current_shopping_cart
      @line_items = @cart.pending_line_items
      @totol_price = @line_items.sum {|item| item.total_amount} || 1
      @totol_price = @totol_price.zero? ? 1 : @totol_price
      @order_id = RazorpayClient.create_order(@totol_price, current_user.id, @cart.id).dig("id")
    end
  end
end
