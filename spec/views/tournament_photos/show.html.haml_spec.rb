require 'spec_helper'

describe "tournament_photos/show" do
  before(:each) do
    @tournament_photo = assign(:tournament_photo, stub_model(TournamentPhoto))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
