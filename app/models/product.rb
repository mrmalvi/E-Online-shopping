class Product < ApplicationRecord
  searchkick

  validates :price, presence: true

  belongs_to :user # for seller
  belongs_to :category
  has_many :line_items
  has_many :reviews
  has_many :product_variants

  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
