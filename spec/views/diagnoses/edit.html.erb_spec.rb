require 'spec_helper'

describe "diagnoses/edit.html.erb" do
  before(:each) do
    @diagnosis = assign(:diagnosis, stub_model(Diagnosis,
      :name => "MyString",
      :describe => "MyText"
    ))
  end

  it "renders the edit diagnosis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => diagnoses_path(@diagnosis), :method => "post" do
      assert_select "input#diagnosis_name", :name => "diagnosis[name]"
      assert_select "textarea#diagnosis_describe", :name => "diagnosis[describe]"
    end
  end
end
