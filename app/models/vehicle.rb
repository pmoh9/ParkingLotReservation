class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :transacts
  validates :vehnumber, presence: { :message => "Must be a valid Vehicle Number" }, uniqueness: { case_sensitive: false }
  validates :vehname, presence: { :message => "Can't leave Vehicle Nickname empty" }
  validates :vehtype, presence: true
  before_save { self.vehnumber = vehnumber.upcase }
end
