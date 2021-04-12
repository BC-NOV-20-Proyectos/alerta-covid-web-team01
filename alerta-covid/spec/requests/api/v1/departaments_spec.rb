 require 'rails_helper'

RSpec.describe "api/v1//departaments", type: :request do

  let!(:institution) { create(:institution) }
  let!(:departament) { create(:departament, institution_id: institution.id) }
  let(:valid_attributes) { { institution_id: institution.id, name: "test departament" } }
  let(:invalid_attributes) { { institution_id: nil, name: nil } }

  describe "GET /index" do
    it "renders a successful response" do
      get "/api/v1/departaments"
      expect(response).to have_http_status(:ok)
    end
  end
end
