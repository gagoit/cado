require 'spec_helper'

describe "team_photos/new" do
  before(:each) do
    assign(:team_photo, stub_model(TeamPhoto).as_new_record)
  end

  it "renders new team_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", team_photos_path, "post" do
    end
  end
end
