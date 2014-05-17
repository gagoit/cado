require 'spec_helper'

describe "match_photos/show" do
  before(:each) do
    @match_photo = assign(:match_photo, stub_model(MatchPhoto))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
