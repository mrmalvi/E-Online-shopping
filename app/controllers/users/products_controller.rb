module Users
  class ProductsController < BaseController

    def show
    end

    def index
      @categories = Category.includes(:products)
    end

  end
end
