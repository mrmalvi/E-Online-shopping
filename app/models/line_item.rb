class LineItem < ApplicationRecord
  enum status: { pending: "pending", completed: "completed" }
  validates :quantity, numericality: { greater_than: 0 }
  validate :check_status

  belongs_to :cart, optional: true
  belongs_to :order, optional: true
  belongs_to :product

  scope :cart_product, ->(product) { where(product: product) }

  def total_amount
    product.price.to_f * quantity
  end

  private
  def check_status
    errors.add(:status, "Cart deactivated please try again later") if cart.deactivated? && pending?
  end
end
