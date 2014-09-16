class User < ActiveRecord::Base
	has_many :events, :dependent => :destroy
	# accepts_nested_attributes_for :events, :allow_destroy
end
