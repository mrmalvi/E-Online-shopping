class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { customer: :customer, seller: :seller, admin: :admin }

  has_many :login_activities, as: :user
  has_many :orders
  has_many :carts
  has_many :products #sellers

  def email_required?
    false
  end

  def password_required?
    false
  end
end
