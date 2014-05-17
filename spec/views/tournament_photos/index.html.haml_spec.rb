require 'spec_helper'

describe "tournament_photos/index" do
  before(:each) do
    assign(:tournament_photos, [
      stub_model(TournamentPhoto),
      stub_model(TournamentPhoto)
    ])
  end

  it "renders a list of tournament_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
