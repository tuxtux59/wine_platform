require 'rails_helper'

RSpec.describe Api::TastingNotesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/tasting_notes').to route_to('api/tasting_notes#index')
    end

    it 'routes to #show' do
      expect(get: '/api/tasting_notes/1').to route_to('api/tasting_notes#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/tasting_notes').to route_to('api/tasting_notes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/tasting_notes/1').to route_to('api/tasting_notes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/tasting_notes/1').to route_to('api/tasting_notes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/tasting_notes/1').to route_to('api/tasting_notes#destroy', id: '1')
    end
  end
end
