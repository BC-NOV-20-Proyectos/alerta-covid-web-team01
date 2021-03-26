require "rails_helper"

RSpec.describe DepartamentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/departaments").to route_to("departaments#index")
    end

    it "routes to #new" do
      expect(get: "/departaments/new").to route_to("departaments#new")
    end

    it "routes to #show" do
      expect(get: "/departaments/1").to route_to("departaments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/departaments/1/edit").to route_to("departaments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/departaments").to route_to("departaments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/departaments/1").to route_to("departaments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/departaments/1").to route_to("departaments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/departaments/1").to route_to("departaments#destroy", id: "1")
    end
  end
end
