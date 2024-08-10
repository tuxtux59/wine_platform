module Api
  # Controller Class To handle TastingNotes through API
  class TastingNotesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_tasting_note, only: %i[show update destroy]

    # GET /api/tasting_notes
    # GET /api/tasting_notes.json
    def index
      @tasting_notes = TastingNote.all
    end

    # GET /api/tasting_notes/1
    # GET /api/tasting_notes/1.json
    def show; end

    # POST /api/tasting_notes
    # POST /api/tasting_notes.json
    def create
      @tasting_note = TastingNote.new(tasting_note_params)

      if @tasting_note.save
        render :show, status: :created, location: api_tasting_note_url(@tasting_note)
      else
        render json: @tasting_note.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/tasting_notes/1
    # PATCH/PUT /api/tasting_notes/1.json
    def update
      if @tasting_note.update(tasting_note_params)
        render :show, status: :ok, location: api_tasting_note_url(@tasting_note)
      else
        render json: @tasting_note.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/tasting_notes/1
    # DELETE /api/tasting_notes/1.json
    def destroy
      @tasting_note.destroy!
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tasting_note
      @tasting_note = TastingNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tasting_note_params
      params.require(:tasting_note).permit(:score, :bottle_id, :expert_id)
    end
  end
end
