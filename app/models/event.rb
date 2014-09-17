class Event < ActiveRecord::Base
	belongs_to :user, class_name: "User", foreign_key: :user_id, inverse_of: :events
	has_many :uploads, :dependent => :destroy
end