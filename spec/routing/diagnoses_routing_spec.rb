require "spec_helper"

describe DiagnosesController do
  describe "routing" do

    it "routes to #index" do
      get("/diagnoses").should route_to("diagnoses#index")
    end

    it "routes to #new" do
      get("/diagnoses/new").should route_to("diagnoses#new")
    end

    it "routes to #show" do
      get("/diagnoses/1").should route_to("diagnoses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/diagnoses/1/edit").should route_to("diagnoses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/diagnoses").should route_to("diagnoses#create")
    end

    it "routes to #update" do
      put("/diagnoses/1").should route_to("diagnoses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/diagnoses/1").should route_to("diagnoses#destroy", :id => "1")
    end

  end
end
