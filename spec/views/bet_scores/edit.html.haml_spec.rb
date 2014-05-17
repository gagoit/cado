require 'spec_helper'

describe "bet_scores/edit" do
  before(:each) do
    @bet_score = assign(:bet_score, stub_model(BetScore))
  end

  it "renders the edit bet_score form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bet_score_path(@bet_score), "post" do
    end
  end
end
