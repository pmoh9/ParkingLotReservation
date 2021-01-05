class User < ApplicationRecord
	has_secure_password
	has_many :vehicles
	has_many :transactions
	validates :name, presence: { :message => "Must be a valid username" }, length: { minimum: 3, maximum: 35 }
	validates :email, presence: { :message => "Must be a valid email id" }, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: { :message => "Password mismatch" }
	validates :phone, length: { is: 10 }, presence: { :message => "Must be a valid Phone No." }, format: { with: /\A\d+\z/ }
	before_save { self.email = email.downcase }
end
