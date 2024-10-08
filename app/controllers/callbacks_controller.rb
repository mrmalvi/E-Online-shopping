class CallbacksController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    if RazorpayClient.verify_payment_signature?(params)
      current_shopping_cart.deactivated!
      total_price = current_shopping_cart&.pending_total_amount
      @order = Order.new(
        user: current_user,
        total_price: total_price
      )
      if current_user && @order.save
        @order.confirmed!
        @order.create_payment(status: :success, external_payment_id: params[:razorpay_payment_id], external_order_id: params[:razorpay_order_id], total_price: total_price)
        current_shopping_cart.associate_line_items_with_order(@order)
        current_shopping_cart.activated!
        flash[:notice] = "Your order has been placed successfully!"
      else
        flash[:alert] = "There was an issue placing your order."
      end
    else
      flash[:alert] = "There was an issue payment"
    end
    redirect_to users_products_url
  end

  private

    def current_shopping_cart
      @current_shopping_cart ||= if current_user
        current_user.customer_shopping_cart
      end
    end

    def current_user
      @current_user ||= begin
        user = User.find_by(id: fetch_notes['customer_id'])
        sign_in user
        user
      end
    end

    def fetch_notes
      @fetch_notes ||= RazorpayClient.fetch_notes(params[:razorpay_payment_id])
    end
end
