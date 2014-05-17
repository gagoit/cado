require 'spec_helper'

describe "bet_scores/show" do
  before(:each) do
    @bet_score = assign(:bet_score, stub_model(BetScore))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
