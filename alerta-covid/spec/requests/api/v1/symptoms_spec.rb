require 'rails_helper'

RSpec.describe "api/v1/symptoms", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      get "/api/v1/symptoms"
      expect(response).to have_http_status(:ok)
    end
  end
end
