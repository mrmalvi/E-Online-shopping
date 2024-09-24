class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { customer: :customer, seller: :seller, admin: :admin }

  has_many :orders
  has_many :carts
  has_many :products #sellers
end
