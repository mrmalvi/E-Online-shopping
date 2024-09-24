class Product < ApplicationRecord
  searchkick
  belongs_to :user # for seller
  belongs_to :category
  has_many :line_items
  # has_many :reviews
  # has_many :variants

  scope :by_category, ->(category_id) { where(category_id: category_id) }
end
