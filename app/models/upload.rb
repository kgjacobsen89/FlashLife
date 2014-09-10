class Upload < ActiveRecord::Base
	belongs_to :event
	has_attached_file :upload_file
end
