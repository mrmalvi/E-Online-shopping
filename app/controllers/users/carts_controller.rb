module Users
  class CartsController < BaseController
    def show
      @cart = current_shopping_cart
      @line_items = @cart.line_items
      @totol_price = current_shopping_cart.line_items.sum {|item| item.total_price}

      @para_attr = {
        "amount": @totol_price.to_i * 100,
        "currency": "INR",
        "receipt": "receipt#1",
        "notes": {
          "key1": "value3",
          "key2": "value2"
        }
      }
      Razorpay::Order.create(@para_attr)
      @order_id = Razorpay::Order.create(@para_attr).attributes.dig("id")
    end
  end
end
