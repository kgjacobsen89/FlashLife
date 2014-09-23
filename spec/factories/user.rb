FactoryGirl.define do 
	factory :user do
		first_name "Kyle"
		last_name "Jacobsen"
		email "Test@testing.com"
		password "Testing"
		address "1201 Oaklawn Rd, Arcadia, CA 91006"
		phone_number "(626) 533-8652"
	end
end