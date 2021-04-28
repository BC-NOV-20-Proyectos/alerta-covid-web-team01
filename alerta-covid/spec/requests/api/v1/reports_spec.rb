require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  describe 'GET api/v1/reports/users' do
    it 'returns http success' do
      get '/api/v1/reports/users'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET api/v1/reports/' do
    it 'returns http success' do
      get '/api/v1/reports/users?commit=all'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET api/v1/reports/' do
    it 'returns http success' do
      get '/api/v1/reports/users?start=2021-04-21&finish=2021-04-30&commit=filter'
      expect(response).to have_http_status(:ok)
    end
  end
end
