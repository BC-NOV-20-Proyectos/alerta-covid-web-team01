require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /reports/users" do
    it "returns http success" do
      get "/reports/users"
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /reports/" do
    it "returns http success" do
      get "/reports/users?start=2021-04-21&finish=2021-04-30&commit=filter"
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /reports/" do
    it "returns http success" do
      get "/reports/users?commit=all"
      expect(response).to have_http_status(:found)
    end
  end
end
