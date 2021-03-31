require "rails_helper"

RSpec.describe CovidTestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/covid_tests").to route_to("covid_tests#index")
    end
  end
end
