class LineItem < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :cart, optional: true
  belongs_to :order, optional: true
  belongs_to :product

  scope :cart_product, ->(product) { where(product: product) }

  def total_price
    product.price.to_f * quantity
  end
end
