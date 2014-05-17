require "spec_helper"

describe MatchPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/match_photos").should route_to("match_photos#index")
    end

    it "routes to #new" do
      get("/match_photos/new").should route_to("match_photos#new")
    end

    it "routes to #show" do
      get("/match_photos/1").should route_to("match_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/match_photos/1/edit").should route_to("match_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/match_photos").should route_to("match_photos#create")
    end

    it "routes to #update" do
      put("/match_photos/1").should route_to("match_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/match_photos/1").should route_to("match_photos#destroy", :id => "1")
    end

  end
end
