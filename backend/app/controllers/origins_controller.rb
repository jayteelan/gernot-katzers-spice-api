class OriginsController < ApplicationController
  before_action :set_origin, only: [:show, :update, :destroy]

  # GET /origins
  def index
    @origins = Origin.all

    render json: @origins
  end

  # GET /origins/1
  def show
    render json: @origin
  end

  # POST /origins
  def create
    @origin = Origin.new(origin_params)

    if @origin.save
      render json: @origin, status: :created, location: @origin
    else
      render json: @origin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /origins/1
  def update
    if @origin.update(origin_params)
      render json: @origin
    else
      render json: @origin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /origins/1
  def destroy
    @origin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_origin
      @origin = Origin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def origin_params
      params.require(:origin).permit(:spice_id, :area)
    end
end
