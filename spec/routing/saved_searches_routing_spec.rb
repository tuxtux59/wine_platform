require 'rails_helper'

RSpec.describe SavedSearchesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/saved_searches').to route_to('saved_searches#index')
    end

    it 'routes to #new' do
      expect(get: '/saved_searches/new').to route_to('saved_searches#new')
    end

    it 'routes to #show' do
      expect(get: '/saved_searches/1').to route_to('saved_searches#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/saved_searches/1/edit').to route_to('saved_searches#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/saved_searches').to route_to('saved_searches#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/saved_searches/1').to route_to('saved_searches#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/saved_searches/1').to route_to('saved_searches#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/saved_searches/1').to route_to('saved_searches#destroy', id: '1')
    end
  end
end
