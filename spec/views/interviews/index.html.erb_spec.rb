require 'spec_helper'

describe "interviews/index.html.erb" do
  before(:each) do
    assign(:interviews, [
      stub_model(Interview,
        :disp_no => 1,
        :note => "Note"
      ),
      stub_model(Interview,
        :disp_no => 1,
        :note => "Note"
      )
    ])
  end

  it "renders a list of interviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
