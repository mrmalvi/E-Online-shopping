module Users
  class OrdersController < BaseController
    skip_before_action :verify_authenticity_token, only: [:create]

    def show
    end

    def index
      @orders = current_user.orders
    end

    # def buy_now
      # @product = Product.find(params[:product_id])
      # total_price = @product.price.to_f * params[:quantity].to_i
      # @order = Order.new(
      #   user: current_user,
      #   total_price: total_price
      # )
      # if @order.save
      #   debugger
      #   @order.line_items.create(order: @order, product: @product, product_variant_id: params[:product_variant_id], total_price: total_price, quantity: params[:quantity], cart: current_shopping_cart)
      #   flash[:notice] = "Your order has been placed successfully!"
      #   redirect_to users_orders_path
      # else
      #   flash[:alert] = "There was an issue placing your order."
      #   redirect_to users_product_path(@product)
      # end
    # end

    def create
      @product = Product.find(params[:product_id])
      total_price = @product.price.to_f * params[:quantity].to_i
      @order = Order.new(
        user: current_user,
        total_price: total_price
      )
      if @order.save
        associate_line_items_with_order(@order)
        flash[:notice] = "Your order has been placed successfully!"
        redirect_to users_orders_path
      else
        flash[:alert] = "There was an issue placing your order."
        redirect_to users_product_path(@product)
      end
    end

    private
      def associate_line_items_with_order(order)
        current_shopping_cart.line_items.each do |line_item|
          line_item.update(order: order.id)
        end
      end
  end
end
