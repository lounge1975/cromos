require 'spec_helper'

describe "interviews/show.html.erb" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :disp_no => 1,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Note/)
  end
end
