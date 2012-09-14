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

  it "should valid possible states for default user and ads current state draft" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    states = advertisement.possible_states(User.new)
    states.should == [:draft, :new]
  end

  it "should valid possible states for default user and ads current state cancel " do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'canceled'
    states = advertisement.possible_states(User.new)
    states.should == [:draft]
  end

  it "should valid possible states for default user and ads current state archive" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'archived'
    states = advertisement.possible_states(User.new)
    states.should == [:draft]
  end

  it "should no possible state for user and ads with state new" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'new'
    states = advertisement.possible_states(User.new)
    states.should == []
  end

  it "should no possible state for user and ads with state approved" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'approved'
    states = advertisement.possible_states(User.new)
    states.should == []
  end

  it "should no possible state for user and ads with state published" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'published'
    states = advertisement.possible_states(User.new)
    states.should == []
  end

  it "should valid possible states for admin and ads with current state new" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'new'
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == [:cancel, :approve]
  end

  it "should no possible states for admin and ads with current state draft" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'draft'
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == []
  end

  it "should no possible states for admin and ads with current state archived" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'archived'
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == []
  end

  it "should no possible states for admin and ads with current state canceled" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'canceled'
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == []
  end

  it "should no possible states for admin and ads with current state approved" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'approved'
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == []
  end

  it "should no possible states for admin and ads with current state published" do
    advertisement = Advertisement.new(:content => "123", :phone_number => "123123123")
    advertisement.state = 'published'
    user = User.new
    user.role = :admin
    states = advertisement.possible_states(user)
    states.should == []
  end

end
