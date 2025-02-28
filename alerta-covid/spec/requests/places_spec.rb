 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/places", type: :request do
  
  let!(:area) { create(:area) }
  let!(:place) { create(:place, area_id: area.id) }
  let(:valid_attributes) { { name: "Test Place", area_id: area.id } }
  let(:invalid_attributes) { { name: nil, area_id: nil } }

  describe "GET /index" do
    it "renders a successful response" do
      get places_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get place_url(place)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_place_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_place_url(place)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Place" do
        expect {
          post places_url, params: { place: valid_attributes }
        }.to change(Place, :count).by(1)
      end

      it "redirects to the created place" do
        post places_url, params: { place: valid_attributes }
        expect(response).to redirect_to(place_url(Place.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Place" do
        expect {
          post places_url, params: { place: invalid_attributes }
        }.to change(Place, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post places_url, params: { place: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New Place", area_id: area.id}
      }

      it "updates the requested place" do
        patch place_url(place), params: { place: new_attributes }
        place.reload
        expect(response).to have_http_status(:found)
      end

      it "redirects to the place" do
        patch place_url(place), params: { place: new_attributes }
        place.reload
        expect(response).to redirect_to(place_url(place))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch place_url(place), params: { place: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested place" do
      expect {
        delete place_url(place)
      }.to change(Place, :count).by(-1)
    end

    it "redirects to the places list" do
      delete place_url(place)
      expect(response).to redirect_to(places_url)
    end
  end
end
