require 'spec_helper'

describe "match_photos/new" do
  before(:each) do
    assign(:match_photo, stub_model(MatchPhoto).as_new_record)
  end

  it "renders new match_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", match_photos_path, "post" do
    end
  end
end
