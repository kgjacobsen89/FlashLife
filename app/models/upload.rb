class Upload < ActiveRecord::Base
	belongs_to :event

	has_attached_file :uploaded_file,  styles: { original: "800x538>", originalv: "404x600>", small: "400x269>", smallv: "202x300>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :uploaded_file, :content_type =>/\Aimage\/.*\Z/
end
