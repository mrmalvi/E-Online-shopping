class ProductVariant < ApplicationRecord
  belongs_to :product

  validates :size, :color, :stock, presence: true
end
