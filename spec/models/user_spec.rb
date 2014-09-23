require "spec_helper"

describe "User" do
  it "is valid with first_name, last_name, email, password, address, and phone_number" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a first_name" do
    user = FactoryGirl.build(:user, first_name: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a last_name" do
    user = FactoryGirl.build(:user, last_name: nil)
    expect(user).to be_invalid
  end
  
  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to be_invalid
  end
  
  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).to be_invalid
  end

  it "is invalid without an address" do
    user = FactoryGirl.build(:user, address: nil)
    expect(user).to be_invalid
  end

  it "should have many Campaigns" do
    relation = Business.reflect_on_association(:events)
    relation.macro.should == :has_many
  end

  it "should have an email meeting validation requirements" do
    expect("testing@gmail.com").to match(/\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i)
    expect("testing.com").to_not match(/\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i)
    expect("testing@gmail").to_not match(/\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i)
  end
end