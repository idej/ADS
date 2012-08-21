require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"

  it "user default role should be valid" do
    User.new.role == "user"
  end
end
