require "spec_helper"

describe TeamPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/team_photos").should route_to("team_photos#index")
    end

    it "routes to #new" do
      get("/team_photos/new").should route_to("team_photos#new")
    end

    it "routes to #show" do
      get("/team_photos/1").should route_to("team_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/team_photos/1/edit").should route_to("team_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/team_photos").should route_to("team_photos#create")
    end

    it "routes to #update" do
      put("/team_photos/1").should route_to("team_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/team_photos/1").should route_to("team_photos#destroy", :id => "1")
    end

  end
end
