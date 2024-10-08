require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/tasting_notes', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # TastingNote. As you add validations to TastingNote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      TastingNote.create! valid_attributes
      get tasting_notes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      tasting_note = TastingNote.create! valid_attributes
      get tasting_note_url(tasting_note)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_tasting_note_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      tasting_note = TastingNote.create! valid_attributes
      get edit_tasting_note_url(tasting_note)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new TastingNote' do
        expect do
          post tasting_notes_url, params: { tasting_note: valid_attributes }
        end.to change(TastingNote, :count).by(1)
      end

      it 'redirects to the created tasting_note' do
        post tasting_notes_url, params: { tasting_note: valid_attributes }
        expect(response).to redirect_to(tasting_note_url(TastingNote.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new TastingNote' do
        expect do
          post tasting_notes_url, params: { tasting_note: invalid_attributes }
        end.to change(TastingNote, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post tasting_notes_url, params: { tasting_note: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested tasting_note' do
        tasting_note = TastingNote.create! valid_attributes
        patch tasting_note_url(tasting_note), params: { tasting_note: new_attributes }
        tasting_note.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the tasting_note' do
        tasting_note = TastingNote.create! valid_attributes
        patch tasting_note_url(tasting_note), params: { tasting_note: new_attributes }
        tasting_note.reload
        expect(response).to redirect_to(tasting_note_url(tasting_note))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        tasting_note = TastingNote.create! valid_attributes
        patch tasting_note_url(tasting_note), params: { tasting_note: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested tasting_note' do
      tasting_note = TastingNote.create! valid_attributes
      expect do
        delete tasting_note_url(tasting_note)
      end.to change(TastingNote, :count).by(-1)
    end

    it 'redirects to the tasting_notes list' do
      tasting_note = TastingNote.create! valid_attributes
      delete tasting_note_url(tasting_note)
      expect(response).to redirect_to(tasting_notes_url)
    end
  end
end
