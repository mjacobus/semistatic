require "spec_helper"


describe Zpages::PagesController, "routing" do


  xit "routes to #index" do
    get("/admin/pages").should route_to("pages#index")
  end

  xit "routes to #new" do
    get("/pages/new").should route_to("zpages/pages#new")
  end

  xit "routes to #show" do
    get("/pages/1").should route_to("zpages/pages#show", :id => "1")
  end

  xit "routes to #edit" do
    get("/pages/1/edit").should route_to("zpages/pages#edit", :id => "1")
  end

  xit "routes to #create" do
    post("/pages").should route_to("zpages/pages#create")
  end

  xit "routes to #update" do
    put("/pages/1").should route_to("zpages/pages#update", :id => "1")
  end

  xit "routes to #destroy" do
    delete("/pages/1").should route_to("zpages/pages#destroy", :id => "1")
  end
end