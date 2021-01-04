class User < ApplicationRecord
	has_secure_password
	has_many :vehicles
	validates :name, presence: true, length: { minimum: 3, maximum: 35 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates :password, length: { minimum: 6 }
	validates :phone, length: { is: 10 }, presence: true, format: { with: /\A\d+\z/ }
	before_save { self.email = email.downcase }
end
