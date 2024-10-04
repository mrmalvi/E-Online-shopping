module ApplicationHelper
  include BootstrapHelper

  def active_cart_line_items
    @active_line_items ||= current_shopping_cart.pending_line_items
  end

  def display_created_date(time)
    time.strftime("(%H:%M %p) %d %b %Y %Z") if time
  end
end
