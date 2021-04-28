require 'rails_helper'

RSpec.describe ReportsController, type: :routing do
  describe 'routing' do
    it 'routes to #user' do
      expect(get: '/reports/users').to route_to('reports#users')
    end

    it 'routes to #user with params all' do
      expect(get: '/reports/users?commit=all').to route_to('reports#users', commit: 'all')
    end

    it 'routes to #user with params filter' do
      expect(get: '/reports/users?start=2021-04-21&finish=2021-04-30&commit=filter').to route_to('reports#users',
                                                                                                 commit: 'filter', start: '2021-04-21', finish: '2021-04-30')
    end

    it 'routes to #places' do
      expect(get: '/reports/places').to route_to('reports#places')
    end
  end
end
