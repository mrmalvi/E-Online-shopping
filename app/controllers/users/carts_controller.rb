module Users
  class CartsController < BaseController
    def show
      @cart = current_shopping_cart
      @line_items = @cart.line_items.not_completed
      @totol_price = @line_items.sum {|item| item.total_amount} || 1
      @totol_price = @totol_price.zero? ? 1 : @totol_price
      @para_attr = {
        "amount": @totol_price.to_i * 100,
        "currency": "INR",
        "receipt": "receipt#1",
        "notes": {
          "customer_id": current_user.id,
          "cart_id": @cart.id
        }
      }
      @order_id = Razorpay::Order.create(@para_attr).attributes.dig("id")
    end
  end
end
