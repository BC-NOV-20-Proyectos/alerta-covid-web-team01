require "rails_helper"

RSpec.describe SymptomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/symptoms").to route_to("symptoms#index")
    end
  end
end
