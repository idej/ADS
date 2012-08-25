require 'spec_helper'

describe User do
  it "user default role should be valid" do
    user = FactoryGirl.create(:user)
    user.role.should == "user"
  end
end
