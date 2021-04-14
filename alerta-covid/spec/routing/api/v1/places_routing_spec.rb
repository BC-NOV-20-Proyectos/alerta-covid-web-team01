require "rails_helper"

RSpec.describe PlacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/places").to route_to("api/v1/places#index")
    end
  end
end