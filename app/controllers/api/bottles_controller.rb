module Api
  # class controller to handle bottles through API
  class BottlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_bottle, only: %i[show update destroy]

    # GET /api/bottles
    # GET /api/bottles.json
    def index
      @bottles = Bottle.all
    end

    # GET /api/bottles/1
    # GET /api/bottles/1.json
    def show; end

    # POST /api/bottles
    # POST /api/bottles.json
    def create
      @bottle = Bottle.new(bottle_params)
      if @bottle.save
        render :show, status: :created, location: api_bottle_url(@bottle.id)
      else
        render json: @bottle.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/bottles/1
    # PATCH/PUT /api/bottles/1.json
    def update
      if @bottle.update(bottle_params)
        render :show, status: :ok, location: api_bottle_url(@bottle.id)
      else
        render json: @bottle.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/bottles/1
    # DELETE /api/bottles/1.json
    def destroy
      @bottle.destroy!
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_bottle
      @bottle = Bottle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bottle_params
      params.require(:bottle).permit(:name, :thumb, :sale_url, :vintage, :grape_variety)
    end
  end
end
