require 'spec_helper'

describe "standings/new" do
  before(:each) do
    assign(:standing, stub_model(Standing).as_new_record)
  end

  it "renders new standing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", standings_path, "post" do
    end
  end
end
