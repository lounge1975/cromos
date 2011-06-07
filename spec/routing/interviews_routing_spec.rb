require "spec_helper"

describe InterviewsController do
  describe "routing" do

    it "routes to #index" do
      get("/interviews").should route_to("interviews#index")
    end

    it "routes to #new" do
      get("/interviews/new").should route_to("interviews#new")
    end

    it "routes to #show" do
      get("/interviews/1").should route_to("interviews#show", :id => "1")
    end

    it "routes to #edit" do
      get("/interviews/1/edit").should route_to("interviews#edit", :id => "1")
    end

    it "routes to #create" do
      post("/interviews").should route_to("interviews#create")
    end

    it "routes to #update" do
      put("/interviews/1").should route_to("interviews#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/interviews/1").should route_to("interviews#destroy", :id => "1")
    end

  end
end
