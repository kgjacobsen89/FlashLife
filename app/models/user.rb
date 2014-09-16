class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
	has_many :events, class_name: "Event", foreign_key: :user_id, inverse_of: :user
	has_secure_password
end
