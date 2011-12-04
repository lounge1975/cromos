require 'spec_helper'

describe "diagnoses/new.html.erb" do
  before(:each) do
    assign(:diagnosis, stub_model(Diagnosis,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new diagnosis form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => diagnoses_path, :method => "post" do
      assert_select "input#diagnosis_name", :name => "diagnosis[name]"
      assert_select "textarea#diagnosis_description", :name => "diagnosis[description]"
    end
  end
end
