require 'spec_helper'

describe "standings/edit" do
  before(:each) do
    @standing = assign(:standing, stub_model(Standing))
  end

  it "renders the edit standing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", standing_path(@standing), "post" do
    end
  end
end
