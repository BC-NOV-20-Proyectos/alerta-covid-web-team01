require 'rails_helper'

RSpec.describe "Roles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/roles/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/roles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/roles/update"
      expect(response).to have_http_status(:success)
    end
  end

end
