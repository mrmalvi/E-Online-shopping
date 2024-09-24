class Category < ApplicationRecord
  has_many :products

  # SEO-friendly URLs
  extend FriendlyId
  friendly_id :name, use: :slugged
end
