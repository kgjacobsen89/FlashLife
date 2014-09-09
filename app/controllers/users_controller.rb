class UsersController < ApplicationController

	def index
		@users = User.all
		@events = Event.all
	end

	def show
		@user = User.find(params[:id])
		@events = Event.all
	end

	def destroy
		User.find(params[:id].destroy)
		session[:user_id] = nil if session[:user_id] == @user.id
		@user.destroy
		redirect_to root_path
	end
	
end
