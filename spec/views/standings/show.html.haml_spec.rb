require 'spec_helper'

describe "standings/show" do
  before(:each) do
    @standing = assign(:standing, stub_model(Standing))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
