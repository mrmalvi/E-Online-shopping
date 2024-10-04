class Cart < ApplicationRecord
  enum status: { activated: "activated", deactivated: "deactivated" }
  belongs_to :user
  has_many :line_items

  def total_price
    line_items.to_a.sum { |item| item.total_amount }.to_i
  end

  def pending_total_amount
    pending_line_items.to_a.sum { |item| item.total_amount }.to_i
  end

  def pending_line_items
    @pending_line_items ||= line_items.not_completed
  end
end
