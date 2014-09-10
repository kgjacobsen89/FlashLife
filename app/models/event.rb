class Event < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user

	has_many :uploads, :dependent => :destroy
	accepts_nested_attributes_for :uploads,  :allow_destroy => true, reject_if: :all_blank
end
