require 'spec_helper'

describe "standings/index" do
  before(:each) do
    assign(:standings, [
      stub_model(Standing),
      stub_model(Standing)
    ])
  end

  it "renders a list of standings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
