 require 'rails_helper'

RSpec.describe "/areas", type: :request do
  let(:valid_attributes) {
    {name: "demo"}
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  before(:each) do
    FactoryBot.create(:institution, id:1, name: "institution")
    FactoryBot.create(:area, id:1, institution_id: 1 ,name: "area")
  end

  describe "GET /api/v1/index" do
    it "renders a successful response" do
      get "/api/v1/areas"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/show" do
    it "renders a successful response" do
      get "/api/v1/areas/1"
      expect(response).to have_http_status(:ok)
    end
  end
end
