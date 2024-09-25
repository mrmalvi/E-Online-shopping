module Users
  class OrdersController < BaseController
    def show
    end

    def index
      @orders = current_user.orders
    end

    def create
      @product = Product.find(params[:product_id])
      @order = Order.new(
        product: @product,
        user: current_user,
        quantity: params[:quantity],
        total_price: @product.price * params[:quantity].to_i
      )

      if @order.save
        flash[:notice] = "Your order has been placed successfully!"
        redirect_to orders_path
      else
        flash[:alert] = "There was an issue placing your order."
        redirect_to product_path(@product)
      end
    end

  end
end
