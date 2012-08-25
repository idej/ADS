require 'spec_helper'

describe Advertisement do

  it "should be valid" do
    advertisement = FactoryGirl.create(:advertisement)
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
end
