 require 'rails_helper'

RSpec.describe "api/v1/areas", type: :request do
  
  let!(:institution) { create(:institution) }
  let!(:area) { create(:area, institution_id: institution.id) }
  let(:valid_attributes) { { institution_id: institution.id, name: "test area" } }
  let(:invalid_attributes) { { institution_id: nil, name: nil } }

  describe "GET /api/v1/index" do
    it "renders a successful response" do
      get "/api/v1/areas"
      expect(response).to have_http_status(:ok)
    end
  end
end
