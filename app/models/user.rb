class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :email, uniqueness: true
  validates :first_name, format: { with: /\A[A-za-z]+\z/, message: "Only letters are allowed" }
end
