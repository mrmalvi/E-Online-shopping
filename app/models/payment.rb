class Payment < ApplicationRecord
  enum status: { pending: :pending, success: :success, failed: :failed }

  belongs_to :order
end
