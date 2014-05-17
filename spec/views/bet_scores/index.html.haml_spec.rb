require 'spec_helper'

describe "bet_scores/index" do
  before(:each) do
    assign(:bet_scores, [
      stub_model(BetScore),
      stub_model(BetScore)
    ])
  end

  it "renders a list of bet_scores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
