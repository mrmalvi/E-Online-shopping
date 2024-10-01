module Users
  class LineItemsController < BaseController
    before_action :set_line_item, only: %i[show edit update destroy]

    def show
    end

    def create
      @product = Product.find(params[:product_id])
      line_item = current_shopping_cart.line_items.not_completed.find_or_initialize_by(product: @product)
      line_item.quantity += 1
      if current_shopping_cart.activated? && line_item.save
        flash[:notice] = "Add to cart successfully!"
      else
        flash[:alert] = "Add to cart failed!"
      end
      redirect_to users_products_path
    end

    def edit
    end

    def update
      if @line_item.update(line_item_params)
        flash[:notice] = "Quantity changed"
      else
        flash[:alert] = "Add to cart failed!"
      end
      redirect_to users_cart_path(@line_item)
    end

    def destroy
      if @line_item.destroy
        flash[:notice] = "Item remove from cart!"
      else
        flash[:alert] = "Item failed!"
      end
      redirect_to users_cart_path(@line_item)
    end

    private
      def set_line_item
        @line_item = current_shopping_cart.line_items.find(params[:id])
      end

      def line_item_params
        params.required(:line_item).permit(:quantity)
      end
  end
end
