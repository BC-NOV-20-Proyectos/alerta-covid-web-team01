require "rails_helper"

RSpec.describe CovidTestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/covid_tests").to route_to("covid_tests#index")
    end

    it "routes to #new" do
      expect(get: "/covid_tests/new").to route_to("covid_tests#new")
    end

    it "routes to #show" do
      expect(get: "/covid_tests/1").to route_to("covid_tests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/covid_tests/1/edit").to route_to("covid_tests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/covid_tests").to route_to("covid_tests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/covid_tests/1").to route_to("covid_tests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/covid_tests/1").to route_to("covid_tests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/covid_tests/1").to route_to("covid_tests#destroy", id: "1")
    end
  end
end
