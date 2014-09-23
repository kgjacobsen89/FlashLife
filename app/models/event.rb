class Event < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user

	has_many :photos

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end