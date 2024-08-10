require 'rails_helper'

RSpec.describe Api::BottlesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/bottles').to route_to('api/bottles#index')
    end

    it 'routes to #show' do
      expect(get: '/api/bottles/1').to route_to('api/bottles#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/bottles').to route_to('api/bottles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/bottles/1').to route_to('api/bottles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/bottles/1').to route_to('api/bottles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/bottles/1').to route_to('api/bottles#destroy', id: '1')
    end
  end
end
