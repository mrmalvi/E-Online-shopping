module ApplicationHelper
  include BootstrapHelper

  def active_cart_line_items
    @active_line_items ||= current_shopping_cart.line_items.not_completed
  end

  def display_created_date(time)
    time.strftime("(%H:%M %p) %d %b %Y %Z") if time
  end
end
