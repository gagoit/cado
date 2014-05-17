require 'spec_helper'

describe "team_photos/edit" do
  before(:each) do
    @team_photo = assign(:team_photo, stub_model(TeamPhoto))
  end

  it "renders the edit team_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", team_photo_path(@team_photo), "post" do
    end
  end
end
