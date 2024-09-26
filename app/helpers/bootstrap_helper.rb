module BootstrapHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper

  def add_cart(product, options = {})
    # content_tag(:div, class: "box justify-content-between ") do
    # end
    options[:class] = [options[:class], "btn btn-success"].compact.join(' ')
    cart_count = current_shopping_cart.line_items.cart_product(product).count
    @total_items = "x[#{cart_count}]" if !cart_count.zero?
    link_to(users_line_item_path(product), options, data: {}, method: :post) do
      "Add Cart #{@total_items}"
    end
  end

  def buy_now(product, options = {})
    options[:class] = [options[:class], "btn btn-success"].compact.join(' ')
    link_to(users_product_path(product), options, method: :post, data: {}) do
      "Buy Now"
    end
  end
end
