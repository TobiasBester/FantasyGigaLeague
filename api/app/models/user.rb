class User < ApplicationRecord
  has_secure_password

  has_one :manager

  validates :user_name, presence: true, uniqueness: true, length: {maximum: 50, minimum: 2}
  validates :name, presence: true, length: {maximum: 50, minimum: 2}
  validates :email, presence: true, length: {maximum: 50, minimum: 3}
  validates :password, presence: true, length: {maximum: 50, minimum: 10}
end
