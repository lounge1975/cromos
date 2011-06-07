require 'spec_helper'

describe "interviews/edit.html.erb" do
  before(:each) do
    @interview = assign(:interview, stub_model(Interview,
      :disp_no => 1,
      :note => "MyString"
    ))
  end

  it "renders the edit interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path(@interview), :method => "post" do
      assert_select "input#interview_disp_no", :name => "interview[disp_no]"
      assert_select "input#interview_note", :name => "interview[note]"
    end
  end
end
