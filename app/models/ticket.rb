class Ticket < ApplicationRecord
	has_one :excavator ,:autosave => true, dependent: :destroy
	validates_presence_of :request_number
	validates_uniqueness_of :request_number
end
