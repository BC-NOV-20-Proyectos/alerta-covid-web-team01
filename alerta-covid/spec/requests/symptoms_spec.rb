require 'rails_helper'

RSpec.describe "/symptoms", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      get "/institutions"
      expect(response).to be_successful
    end
  end
end
