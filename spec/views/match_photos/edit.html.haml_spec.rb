require 'spec_helper'

describe "match_photos/edit" do
  before(:each) do
    @match_photo = assign(:match_photo, stub_model(MatchPhoto))
  end

  it "renders the edit match_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", match_photo_path(@match_photo), "post" do
    end
  end
end
