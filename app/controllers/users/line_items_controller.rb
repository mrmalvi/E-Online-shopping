module Users
  class LineItemsController < BaseController
    def show
    end

    def create
      @line_item = current_shopping_cart.line_items.new
      @product = Product.find(params[:product_id])
      line_item = @cart.line_items.find_or_initialize_by(product: @product)
      line_item.quantity += 1
      if @line_item.save
        flash[:notice] = "Add to cart successfully!"
      else
        flash[:alert] = "Add to cart failed!"
      end
      redirect_to users_products_path
    end

    def edit
    end

    def update
    end
  end
end
