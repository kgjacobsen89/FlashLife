class Photo < ActiveRecord::Base
	belongs_to :event

def self.find_or_initialize 
	@albums = HTTParty.get('http://api.smugmug.com/services/api/json/1.3.0/?method=smugmug.albums.get&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b')
	@albums["Albums"].each do |k, v|
		@album_urls = "http://api.smugmug.com/services/api/json/1.3.0/?method=smugmug.images.get&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b&AlbumID=" << "#{k['id']}" << "&AlbumKey=" << "#{k['Key']}"
		@album_urls.each do |a|
			@images = HTTParty.get(a)


def self.initialize
	new do |photo|
		photo.original_url = 
		photo.small_url
		photo.save!
	end
end
