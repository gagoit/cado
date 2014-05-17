require 'spec_helper'

describe "team_photos/index" do
  before(:each) do
    assign(:team_photos, [
      stub_model(TeamPhoto),
      stub_model(TeamPhoto)
    ])
  end

  it "renders a list of team_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
