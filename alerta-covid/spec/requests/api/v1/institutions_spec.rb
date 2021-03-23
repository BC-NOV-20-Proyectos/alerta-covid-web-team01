require 'rails_helper'

RSpec.describe "api/v1/institutions", type: :request do
  let(:valid_attributes) {
    {name: "demo"}
  }

  let(:invalid_attributes) {
    {name: ""}
  }

  before(:each) do
    FactoryBot.create(:institution, id: 1 ,name: "fmat")
  end

  describe "GET /index" do
    it "renders a successful response" do
      get "/api/v1/institutions"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
        get "/api/v1/institutions/1"
        expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Institution" do
        post "/api/v1/institutions", params: { institution: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Institution" do
        post "/api/v1/institutions", params: { institution: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "new name"}
      }

      it "updates the requested institution" do
        patch "/api/v1/institutions/1", params: { institution: new_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch "/api/v1/institutions/1", params: { institution: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested institution" do
        delete "/api/v1/institutions/1"
        expect(response).to have_http_status(:ok)
    end
  end
end
