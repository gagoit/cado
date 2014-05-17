require "spec_helper"

describe TournamentPhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/tournament_photos").should route_to("tournament_photos#index")
    end

    it "routes to #new" do
      get("/tournament_photos/new").should route_to("tournament_photos#new")
    end

    it "routes to #show" do
      get("/tournament_photos/1").should route_to("tournament_photos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tournament_photos/1/edit").should route_to("tournament_photos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tournament_photos").should route_to("tournament_photos#create")
    end

    it "routes to #update" do
      put("/tournament_photos/1").should route_to("tournament_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tournament_photos/1").should route_to("tournament_photos#destroy", :id => "1")
    end

  end
end
