require "spec_helper"

describe StandingsController do
  describe "routing" do

    it "routes to #index" do
      get("/standings").should route_to("standings#index")
    end

    it "routes to #new" do
      get("/standings/new").should route_to("standings#new")
    end

    it "routes to #show" do
      get("/standings/1").should route_to("standings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/standings/1/edit").should route_to("standings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/standings").should route_to("standings#create")
    end

    it "routes to #update" do
      put("/standings/1").should route_to("standings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/standings/1").should route_to("standings#destroy", :id => "1")
    end

  end
end
