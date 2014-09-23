class PhotosController < ApplicationController

	def image_urls
		@albums = HTTParty.get('http://api.smugmug.com/services/api/json/1.3.0/
			?method=smugmug.albums.get&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b')
		@albums["Albums"].each do |k, v|
			# k["Title"]
			if k["Title"] == @event.name
				@images = HTTParty.get("http://api.smugmug.com/services/api/json/1.3.0/
					?method=smugmug.images.get&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b
					&AlbumID=" << "#{k['id']}" << "&AlbumKey=" << "#{k['Key']}")
				@images["Images"].each do |a, b|
					@image_urls = HTTParty.get("http://api.smugmug.com/services/api/json/1.3.0/
						?method=smugmug.images.getURLs&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b
						&AlbumID=" << "#{k['id']}" << "&AlbumKey=" << "#{k['Key']}"  << "&ImageID=" << "#{a['id']}" << "&ImageKey=" << "#{a['Key']}")
			end
			@image_urls["Image"].each do |pic|
				url = pic["Image"]["SmallUrl"]
				Photo.find_or_create_by(small_url: small_url)
		end
	end
end