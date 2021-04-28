require 'rails_helper'

RSpec.describe "Incidences", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      get "/incidences/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "render a successful response" do
      get "/incidences/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "render a successful response" do
      get "/incidences/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get "/incidences/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "render a successful response" do
      get "/incidences/update"
      expect(response).to have_http_status(:success)
    end
  end

end