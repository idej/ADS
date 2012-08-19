require 'spec_helper'

describe "advertisements/index" do
  before(:each) do
    assign(:advertisements, [
      stub_model(Advertisement),
      stub_model(Advertisement)
    ])
  end

end
