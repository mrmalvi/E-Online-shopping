class Product < ApplicationRecord
  # searchkick

  validates :price, presence: true

  belongs_to :seller, class_name: "User" # for seller
  belongs_to :category
  has_many :line_items
  has_many :reviews
  has_many :product_variants
  has_many_attached :images

  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
