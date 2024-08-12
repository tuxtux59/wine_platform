#  End User controller for saved search
class SavedSearchesController < ApplicationController
  before_action :set_saved_search, only: %i[show edit update destroy]

  # GET /saved_searches or /saved_searches.json
  def index
    @saved_searches = SavedSearch.all
  end

  # GET /saved_searches/1 or /saved_searches/1.json
  def show; end

  # GET /saved_searches/new
  def new
    @saved_search = SavedSearch.new
  end

  # GET /saved_searches/1/edit
  def edit; end

  # POST /saved_searches or /saved_searches.json
  def create
    @saved_search = SavedSearch.new(saved_search_params)

    respond_to do |format|
      if @saved_search.save
        format.html { redirect_to saved_search_url(@saved_search), notice: 'Saved search was successfully created.' }
        format.json { render :show, status: :created, location: @saved_search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saved_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_searches/1 or /saved_searches/1.json
  def update
    respond_to do |format|
      if @saved_search.update(saved_search_params)
        format.html { redirect_to saved_search_url(@saved_search), notice: 'Saved search was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saved_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_searches/1 or /saved_searches/1.json
  def destroy
    @saved_search.destroy!

    respond_to do |format|
      format.html { redirect_to saved_searches_url, notice: 'Saved search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_saved_search
    @saved_search = SavedSearch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def saved_search_params
    params.require(:saved_search).permit(:user_id, :search_params)
  end
end
