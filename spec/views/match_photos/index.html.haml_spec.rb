require 'spec_helper'

describe "match_photos/index" do
  before(:each) do
    assign(:match_photos, [
      stub_model(MatchPhoto),
      stub_model(MatchPhoto)
    ])
  end

  it "renders a list of match_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
