require "spec_helper"
require "rails_helper"

describe "Event" do

  it "is valid with a user_id, name, date, location, package_type, is_public, and avatar" do
    event = FactoryGirl.build(:event)
    expect(event).to be_valid
  end

  it "is not valid without a name" do
    event = FactoryGirl.build(:event, name: nil)
    expect(event).to be_invalid
  end

  it "is invalid without a date" do
    event = FactoryGirl.build(:event, date: nil)
    expect(event).to be_invalid
  end

  it "should be true or false for is_public" do
    event = FactoryGirl.build(:event, is_public: :inclusion => {:in => [true, false]})
    expect(event).to be_valid
  end 

  it "is invalid without a location" do
    event = FactoryGirl.build(:event, location: nil)
    expect(event).to be_invalid
  end

  it "is invalid without a package_type" do
    event = FactoryGirl.build(:event, package_type: nil)
    expect(event).to be_invalid
  end

  it "should belong to a User" do
    relation = Campaign.reflect_on_association(:user)
    relation.macro.should == :belongs_to
  end
end



