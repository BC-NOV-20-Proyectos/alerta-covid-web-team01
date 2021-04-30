require 'rails_helper'

RSpec.describe ReportsController, type: :routing do
  describe 'routing' do
    it 'routes to #user' do
      expect(get: 'api/v1/reports/users').to route_to('api/v1/reports#users')
    end

    it 'routes to #user with params filter' do
      expect(get: 'api/v1/reports/users?start=2021-04-21&finish=2021-04-30').to route_to('api/v1/reports#users', start: '2021-04-21', finish: '2021-04-30')
    end

    it 'routes to #places' do
      expect(get: 'api/v1/reports/places').to route_to('api/v1/reports#places')
    end
  end
end
