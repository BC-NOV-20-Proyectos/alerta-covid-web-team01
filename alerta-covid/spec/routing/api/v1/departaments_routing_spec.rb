require "rails_helper"

RSpec.describe DepartamentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/departaments").to route_to("api/v1/departaments#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/departaments/1").to route_to("api/v1/departaments#show", id: "1")
    end
  end
end
