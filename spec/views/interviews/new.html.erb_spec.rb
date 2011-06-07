require 'spec_helper'

describe "interviews/new.html.erb" do
  before(:each) do
    assign(:interview, stub_model(Interview,
      :disp_no => 1,
      :note => "MyString"
    ).as_new_record)
  end

  it "renders new interview form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => interviews_path, :method => "post" do
      assert_select "input#interview_disp_no", :name => "interview[disp_no]"
      assert_select "input#interview_note", :name => "interview[note]"
    end
  end
end
