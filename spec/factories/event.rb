FactoryGirl.define do 
	factory :event do
		user
		name "Kyle's Birthday Party"
		date "2014/08/07"
		is_public "true"
		location "The Bungalow, Santa Monica"
		package_type "Flashy Booth"
	end
end