require 'rails_helper'

RSpec.describe TastingNotesController, type: :routing do
  describe 'routing' do
    xit 'routes to #index' do
      expect(get: '/tasting_notes').to route_to('tasting_notes#index')
    end

    it 'routes to #new' do
      expect(get: '/tasting_notes/new').to route_to('tasting_notes#new')
    end

    it 'routes to #show' do
      expect(get: '/tasting_notes/1').to route_to('tasting_notes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/tasting_notes/1/edit').to route_to('tasting_notes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tasting_notes').to route_to('tasting_notes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tasting_notes/1').to route_to('tasting_notes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tasting_notes/1').to route_to('tasting_notes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tasting_notes/1').to route_to('tasting_notes#destroy', id: '1')
    end
  end
end
