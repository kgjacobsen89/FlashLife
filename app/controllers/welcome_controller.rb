class WelcomeController < ApplicationController
  def index
  	@user = User.new
  	@business = Yelp.client.business('flash-life-photo-booth-rental-los-angeles')
  	@albums = HTTParty.get('http://api.smugmug.com/services/api/json/1.3.0/?method=smugmug.albums.get&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b')
  	@images = HTTParty.get("http://api.smugmug.com/services/api/json/1.3.0/?method=smugmug.images.getURLs&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b&AlbumID=43736157&AlbumKey=6v3nxR&ImageID=3470022407&ImageKey=8pVRNJB")
  end
  
  private 

  def album_images
  	api_url = "http://api.smugmug.com/services/api/json/1.3.0/?"
		@albums["Albums"].each do |k, v|
			@images = HTTParty.get( api_url + "method=smugmug.images.get&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&SessionID=6d9a73c0e94275ae27a1cf6df0fade4b&AlbumID=" << "#{k['id']}" << "&AlbumKey=" << "#{k['Key']}")
		end
		# @images["Album"]["Images"].each do |a, b|
		# 	@imageURLs = HTTParty.get( api_url + "method=smugmug.images.getURLs&APIKey=G74NPxhieE70QY5IV2i9QYeGaoU2EyLe&AlbumID=" << "#{k['id']}" << "&AlbumKey=" << "#{k['Key']}" << "&ImageID=" << "#{a['id']}" << "&ImageKey=" << "#{a['Key']}")
		# end
	end

end
