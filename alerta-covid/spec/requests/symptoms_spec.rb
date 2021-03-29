require 'rails_helper'

RSpec.describe "/symptoms", type: :request do

  let(:valid_attributes) {
    {name: "headache"}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Symptom.create! valid_attributes
      get "/institutions"
      expect(response).to be_successful
    end
  end
end
