class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: Devise.email_regexp }, allow_blank: true
  validates :role, presence: true
  validate :check_password, :check_phone_number

  enum role: { customer: "customer", seller: "seller", admin: "admin" }

  has_many :login_activities, as: :user
  has_many :orders
  # has_many :carts
  has_one :shopping_cart, class_name: "Cart"
  has_many :products #sellers

  # before_create :build_shopping_cart, if: :customer?

  def customer_shopping_cart
    shopping_cart || create_shopping_cart if persisted? && customer?
  end

  def email_required?
    false
  end

  def password_required?
    false
  end

  def check_password
    if password != password_confirmation
      errors.add(:password, "Incorrect")
    end
  end

  def check_phone_number
    if !Phonelib.valid?(phone)
      errors.add(:phone, "Incorrect")
    end
  end
end
