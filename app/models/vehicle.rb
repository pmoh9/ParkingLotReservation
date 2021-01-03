class Vehicle < ApplicationRecord
  belongs_to :user
  validates :vehnumber, presence: true, uniqueness: true
  validates :vehname, presence: true
  validates :vehtype, presence: true
end
