require 'spec_helper'
require "rails_helper"

describe UsersController do 
	let :valid_attributes do
		{
			first_name: "Kyle",
			last_name: "Jacobsen",
			email: "kgjacobsen89@gmail.com",
			password: "Testing",
			address: "1201 Oaklawn Rd, Arcadia, CA 91006",
			phone_number: "(626) 533-8652"
		}
	end

	describe "GET show" do
		before do 
			@user = User.create! valid_attributes
			get :show, id: @user.id
		end

		it "should render the show template" do
			expect(response).to render_template :show
		end

		it "should succeed" do
			expect(response).to be_success
		end
		
	end


	describe "POST create" do
		describe "successfully saves" do
			it "should be saved to the DB" do
				expect do
					post :create, user: valid_attributes
				end.to change(User, :count).by(1)
			end

			it "should redirect to the show page for user" do
				post :create, user: valid_attributes
				expect(response).to redirect_to user_path(@user.id)
			end
		end
	end

	describe "GET edit" do
		before do
			@user = User.create! valid_attributes
			get :edit, id: @user.id
		end

		it "should render the edit template" do
		  expect(response).to render_template :edit
		  expect(response).to be_success
		end

		it "should assign the user" do
			expect(assigns(:user)).to eq(@user)
		end
	end

	describe "DELETE user" do
		before do
			@user = User.create! valid_attributes
			get :show, id: @user.id
		end

		it "should delete a user from the database" do
			expect do
				delete :destroy, id: @user.id
			end.to change(User, :count).by(-1)
		end

		it "should redirect to the root page" do
			delete :destroy, id: @user.id
			expect(response).to redirect_to root_path
	 	end
	end
end