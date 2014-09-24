class Event < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user

	has_many :uploads
end