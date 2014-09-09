class PhotosController < ApplicationController

	respond_to :json

	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
	end

	def create
	end

	def destroy
		Photo.find(params[:id]).destroy
		redirect_to photos_path
	end

end
