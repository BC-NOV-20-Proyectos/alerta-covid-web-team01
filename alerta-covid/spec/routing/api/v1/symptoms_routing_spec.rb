require "rails_helper"

RSpec.describe SymptomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/symptoms").to route_to("api/v1/symptoms#index")
    end
  end
end
