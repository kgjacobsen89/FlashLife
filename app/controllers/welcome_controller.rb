class WelcomeController < ApplicationController
  def index
  	@user = User.new
  	@business = Yelp.client.business('flash-life-photo-booth-rental-los-angeles')
  end
end
