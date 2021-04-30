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

    it 'routes to #places with params option 1' do
      expect(get: '/reports/places?option=1&commit=filter').to route_to('reports#places', option: '1', commit: 'all')
    end

    it 'routes to #user with params option 2' do
      expect(get: '/reports/users?option=2&commit=filter').to route_to('reports#places', option: '2', commit: 'all')
    end

    it 'routes to #user with params option 2' do
      expect(get: '/reports/users?option=3&commit=filter').to route_to('reports#places', option: '3', commit: 'all')
    end
  end
end
