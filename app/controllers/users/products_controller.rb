module Users
  class ProductsController < BaseController
    before_action :set_product, only: %i[show]

    def show
    end

    def index
      @categories = Category.includes(:products)
    end

    private
      def set_product
        @product = Product.find(params[:id])
      end
  end
end
