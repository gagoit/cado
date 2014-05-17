require 'spec_helper'

describe "tournament_photos/new" do
  before(:each) do
    assign(:tournament_photo, stub_model(TournamentPhoto).as_new_record)
  end

  it "renders new tournament_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tournament_photos_path, "post" do
    end
  end
end
