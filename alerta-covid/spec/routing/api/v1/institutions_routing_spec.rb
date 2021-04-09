require "rails_helper"

RSpec.describe InstitutionsController, type: :routing do
  describe "routing Api institutions" do
    it "routes to #index" do
      expect(get: "api/v1/institutions").to route_to("api/v1/institutions#index")
    end
  end
end
