module BootstrapHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper

  def add_cart(product, options = {})
    # content_tag(:div, class: "box justify-content-between ") do
    # end
    options[:class] = [options[:class], "btn btn-success"].compact.join(' ')
    options[:method] = :post
    cart_count = current_shopping_cart.line_items.not_completed.cart_product(product).count
    @total_items = "x[#{cart_count}]" if !cart_count.zero?
    link_to(users_line_items_path(product_id: product.id), options, data: {}) do
      "Add Cart #{@total_items}"
    end
  end

  def buy_now(product, options = {})
    options[:class] = [options[:class], "btn btn-success"].compact.join(' ')
    link_to(users_product_path(product), options, data: {}) do
      "Buy Now"
    end
  end
end
