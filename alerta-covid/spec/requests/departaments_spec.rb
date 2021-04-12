 require 'rails_helper'

RSpec.describe "/departaments", type: :request do

  let!(:institution) { create(:institution) }
  let!(:departament) { create(:departament, institution_id: institution.id) }
  let(:valid_attributes) { { institution_id: institution.id, name: "test departament" } }
  let(:invalid_attributes) { { institution_id: nil, name: nil } }

  describe "GET /index" do
    it "renders a successful response" do
      get departaments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get departament_url(departament)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_departament_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_departament_url(departament)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Departament" do
        expect {
          post departaments_url, params: { departament: valid_attributes }
        }.to change(Departament, :count).by(1)
      end

      it "redirects to the created departament" do
        post departaments_url, params: { departament: valid_attributes }
        expect(response).to redirect_to(departament_url(Departament.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Departament" do
        expect {
          post departaments_url, params: { departament: invalid_attributes }
        }.to change(Departament, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post departaments_url, params: { departament: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { institution_id: institution.id, name: "new departament" } }

      it "updates the requested departament" do
        patch departament_url(departament), params: { departament: new_attributes }
        departament.reload
        expect(response).to have_http_status(:found)
      end

      it "redirects to the departament" do
        patch departament_url(departament), params: { departament: new_attributes }
        departament.reload
        expect(response).to redirect_to(departament_url(departament))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch departament_url(departament), params: { departament: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested departament" do
      expect {
        delete departament_url(departament)
      }.to change(Departament, :count).by(-1)
    end

    it "redirects to the departaments list" do
      delete departament_url(departament)
      expect(response).to redirect_to(departaments_url)
    end
  end
end
