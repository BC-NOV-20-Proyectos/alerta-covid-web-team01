require "rails_helper"

RSpec.describe DepartamentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/departaments").to route_to("api/v1/departaments#index")
    end
  end
end
