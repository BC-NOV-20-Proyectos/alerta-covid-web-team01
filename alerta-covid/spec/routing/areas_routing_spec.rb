require "rails_helper"

RSpec.describe AreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/areas").to route_to("api/v1/areas#index")
    end
  end
end
