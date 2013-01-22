require "spec_helper"

module Zpages
  describe PagesController do
    describe "routing" do

      it "routes to #index" do
        get("/pages").should route_to("/zpages/pages#index")
      end

      it "routes to #new" do
        get("/pages/new").should route_to("/zpages/pages#new")
      end

      it "routes to #show" do
        get("/pages/1").should route_to("/zpages/pages#show", :id => "1")
      end

      it "routes to #edit" do
        get("/pages/1/edit").should route_to("/zpages/pages#edit", :id => "1")
      end

      it "routes to #create" do
        post("/pages").should route_to("/zpages/pages#create")
      end

      it "routes to #update" do
        put("/pages/1").should route_to("/zpages/pages#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/pages/1").should route_to("/zpages/pages#destroy", :id => "1")
      end

    end
  end
end
