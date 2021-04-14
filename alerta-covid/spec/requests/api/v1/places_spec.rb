require 'rails_helper'

RSpec.describe "api/v1/places", type: :request do

  let!(:area) { create(:area) }
  let!(:place) { create(:place, area_id: area.id) }
  let(:valid_attributes) { { name: "Test Place", area_id: area.id } }
  let(:invalid_attributes) { { name: nil, area_id: nil } }

  describe "GET /api/v1/places#index" do
    it "renders a successful response" do
      get "/api/v1/places"
      expect(response).to have_http_status(:ok)
    end
  end
end