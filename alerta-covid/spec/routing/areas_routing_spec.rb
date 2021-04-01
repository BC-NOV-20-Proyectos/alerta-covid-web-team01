require "rails_helper"

RSpec.describe AreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/areas").to route_to("api/v1/areas#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/areas/1").to route_to("api/v1/areas#show", id: "1")
    end
  end
end
