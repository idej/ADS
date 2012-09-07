require 'spec_helper'

describe Advertisement do

  it "should be valid" do
    advertisement = Advertisement.new(:content => "content", :phone_number => "number")
    advertisement.should be_valid
  end

  it "is not valid without phone number" do
    advertisement = Advertisement.new(:content => "123", :phone_number => nil)
    advertisement.should_not be_valid
  end

  it "is not valid without content" do
    advertisement = Advertisement.new(:content => nil, :phone_number => "1234566")
    advertisement.should_not be_valid
  end

  it "is return two possible states(draft, publication) for advertisements for user with default role" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    states = advertisement.possible_states(User.new)
    states.should == [:publication, :draft]
  end

  it "is return three possible states(published, canceled, approved) for advertisements admin role" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == [:published, :canceled, :approved]
  end

end
