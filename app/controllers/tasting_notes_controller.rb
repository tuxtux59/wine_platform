# End-User Controller for TastingNotes
class TastingNotesController < ApplicationController
  before_action :set_tasting_note, only: %i[show edit update destroy]
  # GET /tasting_notes/1 or /tasting_notes/1.json
  def show; end

  # GET /tasting_notes/new
  def new
    @tasting_note = TastingNote.new
  end

  # GET /tasting_notes/1/edit
  def edit; end

  # POST /tasting_notes or /tasting_notes.json
  def create
    @tasting_note = TastingNote.new(tasting_note_params)

    respond_to do |format|
      if @tasting_note.save
        format.html { redirect_to tasting_note_url(@tasting_note), notice: 'Tasting note was successfully created.' }
        format.json { render :show, status: :created, location: @tasting_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tasting_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasting_notes/1 or /tasting_notes/1.json
  def update
    respond_to do |format|
      if @tasting_note.update(tasting_note_params)
        format.html { redirect_to tasting_note_url(@tasting_note), notice: 'Tasting note was successfully updated.' }
        format.json { render :show, status: :ok, location: @tasting_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tasting_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasting_notes/1 or /tasting_notes/1.json
  def destroy
    @tasting_note.destroy!

    respond_to do |format|
      format.html { redirect_to tasting_notes_url, notice: 'Tasting note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tasting_note
    @tasting_note = TastingNote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tasting_note_params
    params.require(:tasting_note).permit(:score, :details, :bottle_id, :expert_id)
  end
end
