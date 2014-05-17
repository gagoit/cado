require 'spec_helper'

describe "tournament_photos/edit" do
  before(:each) do
    @tournament_photo = assign(:tournament_photo, stub_model(TournamentPhoto))
  end

  it "renders the edit tournament_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tournament_photo_path(@tournament_photo), "post" do
    end
  end
end
