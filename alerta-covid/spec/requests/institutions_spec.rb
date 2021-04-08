require 'rails_helper'

RSpec.describe "/institutions", type: :request do
  let!(:institution) { FactoryBot.create(:institution) }
  let(:valid_attributes) { {name: "New institution"} }
  let(:invalid_attributes) { {name: nil} }

  describe "GET /index" do
    it "renders a successful response" do
      get institutions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get institution_url(institution)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_institution_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_institution_url(institution)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Institution" do
        expect {
          post institutions_url, params: { institution: valid_attributes }
        }.to change(Institution, :count).by(1)
      end

      it "redirects to the created institution" do
        post institutions_url, params: { institution: valid_attributes }
        expect(response).to redirect_to(institution_url(Institution.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Institution" do
        expect {
          post institutions_url, params: { institution: invalid_attributes }
        }.to change(Institution, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post institutions_url, params: { institution: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { {name: "new name"} }

      it "updates the requested institution" do
        patch institution_url(institution), params: { institution: new_attributes }
        institution.reload
        expect(response).to have_http_status(:found)
      end

      it "redirects to the institution" do
        patch institution_url(institution), params: { institution: new_attributes }
        institution.reload
        expect(response).to redirect_to(institution_url(institution))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch institution_url(institution), params: { institution: invalid_attributes }
        institution.reload  
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested institution" do
      expect {
        delete institution_url(institution)
      }.to change(Institution, :count).by(-1)
    end

    it "redirects to the institutions list" do
      delete institution_url(institution)
      expect(response).to redirect_to(institutions_url)
    end
  end
end
