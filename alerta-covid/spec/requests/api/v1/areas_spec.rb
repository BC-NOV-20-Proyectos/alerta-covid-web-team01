 require 'rails_helper'

RSpec.describe "/areas", type: :request do
  let!(:institution) { FactoryBot.create(:institution) }
  let(:valid_attributes) { FactoryBot.create(:area, institution_id: institution.id) }
  let(:invalid_attributes) { { institution_id: nil, name: nil } }

  describe "GET /api/v1/index" do
    it "renders a successful response" do
      get "/api/v1/areas"
      expect(response).to have_http_status(:ok)
    end
  end
end
