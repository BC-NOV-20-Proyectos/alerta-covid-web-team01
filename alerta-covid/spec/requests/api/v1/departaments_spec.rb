 require 'rails_helper'

RSpec.describe "/departaments", type: :request do
  let(:valid_attributes) {
    {id:2, institution_id: 1,name:"demo"}
  }

  let(:invalid_attributes) {
    {id:"", institution_id: "",name:"demo"}
  }

  before(:each) do
    FactoryBot.create(:institution, id:1, name: "institution")
    FactoryBot.create(:departament, id:1, institution_id: 1 ,name: "area")
  end

  describe "GET /api/v1/index" do
    it "renders a successful response" do
      Departament.create! valid_attributes
      get "/api/v1/departaments"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/show" do
    it "renders a successful response" do
      departament = Departament.create! valid_attributes
      get "/api/v1/departaments/1"
      expect(response).to have_http_status(:ok)
    end
  end
end
