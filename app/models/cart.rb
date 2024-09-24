class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
