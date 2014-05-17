require 'spec_helper'

describe "bet_scores/new" do
  before(:each) do
    assign(:bet_score, stub_model(BetScore).as_new_record)
  end

  it "renders new bet_score form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bet_scores_path, "post" do
    end
  end
end
