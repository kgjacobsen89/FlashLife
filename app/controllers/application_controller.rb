class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

	def current_user
  		@current_user ||=User.find(session[:user_id]) if session[:user_id]
	end

  	helper_method :current_user

  	# def user_new
  	# 	@user = User.new
  	# end

  	# helper_method :user_new

  	# def event_new
  	# 	@event = Event.new 
  	# end

  	# helper_method :event_new

end