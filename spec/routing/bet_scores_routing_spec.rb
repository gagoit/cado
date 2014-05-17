require "spec_helper"

describe BetScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/bet_scores").should route_to("bet_scores#index")
    end

    it "routes to #new" do
      get("/bet_scores/new").should route_to("bet_scores#new")
    end

    it "routes to #show" do
      get("/bet_scores/1").should route_to("bet_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bet_scores/1/edit").should route_to("bet_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bet_scores").should route_to("bet_scores#create")
    end

    it "routes to #update" do
      put("/bet_scores/1").should route_to("bet_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bet_scores/1").should route_to("bet_scores#destroy", :id => "1")
    end

  end
end
