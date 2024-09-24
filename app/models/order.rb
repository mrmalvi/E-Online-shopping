class Order < ApplicationRecord
  enum status: { pending: "pending", paid: "paid", shipped: "shipped", delivered: "delivered" }

  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_one :payment

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
