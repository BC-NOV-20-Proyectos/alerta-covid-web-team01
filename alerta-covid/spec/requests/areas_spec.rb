 require 'rails_helper'

RSpec.describe "/areas", type: :request do
  
  let!(:institution) { FactoryBot.create(:institution) }
  let!(:area) { FactoryBot.create(:area, institution_id: institution.id) }
  let(:valid_attributes) { { institution_id: institution.id, name: "test area" } }
  let(:invalid_attributes) { { institution_id: nil, name: nil } }

  describe "GET /index" do
    it "renders a successful response" do
      get areas_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get area_url(area)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_area_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_area_url(area)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Area" do
        expect {
          post areas_url, params: { area: valid_attributes }
        }.to change(Area, :count).by(1)
      end

      it "redirects to the created area" do
        post areas_url, params: { area: valid_attributes }
        expect(response).to redirect_to(area_url(Area.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Area" do
        expect {
          post areas_url, params: { area: invalid_attributes }
        }.to change(Area, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post areas_url, params: { area: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { {institution_id: institution.id, name: "new area"} }

      it "updates the requested area" do
        patch area_url(area), params: { area: new_attributes }
        area.reload
        expect(response).to have_http_status(:found)
      end

      it "redirects to the area" do
        patch area_url(area), params: { area: new_attributes }
        area.reload
        expect(response).to redirect_to(area_url(area))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch area_url(area), params: { area: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested area" do
      expect {
        delete area_url(area)
      }.to change(Area, :count).by(-1)
    end

    it "redirects to the areas list" do
      delete area_url(area)
      expect(response).to redirect_to(areas_url)
    end
  end
end
