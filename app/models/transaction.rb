class Transaction < ApplicationRecord
	belongs_to :user
	belongs_to :vehicles
	validates :date, presence: true
	validates :time, presence: true
	validates :exittime, presence: true
	validate :exit_time_is_after_start_time
	
	private
	def exit_time_is_after_start_time
	  return if exit_time.blank? || time.blank?

	  if end_time < start_time
	    errors.add(:end_time, "cannot be before the start time") 
	  end 
	end
end
