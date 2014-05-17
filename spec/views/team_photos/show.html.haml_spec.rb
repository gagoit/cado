require 'spec_helper'

describe "team_photos/show" do
  before(:each) do
    @team_photo = assign(:team_photo, stub_model(TeamPhoto))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
