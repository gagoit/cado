require 'spec_helper'

describe "matches/new" do
  before(:each) do
    assign(:match, stub_model(Match).as_new_record)
  end

  it "renders new match form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", matches_path, "post" do
    end
  end
end
