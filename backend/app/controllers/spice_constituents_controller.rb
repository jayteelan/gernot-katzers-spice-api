class SpiceConstituentsController < ApplicationController
  before_action :set_spice_constituent, only: [:show, :update, :destroy]

  # GET /spice_constituents
  def index
    @spice_constituents = SpiceConstituent.all

    render json: @spice_constituents
  end

  # GET /spice_constituents/1
  def show
    render json: @spice_constituent
  end

  # POST /spice_constituents
  def create
    @spice_constituent = SpiceConstituent.new(spice_constituent_params)

    if @spice_constituent.save
      render json: @spice_constituent, status: :created, location: @spice_constituent
    else
      render json: @spice_constituent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spice_constituents/1
  def update
    if @spice_constituent.update(spice_constituent_params)
      render json: @spice_constituent
    else
      render json: @spice_constituent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spice_constituents/1
  def destroy
    @spice_constituent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spice_constituent
      @spice_constituent = SpiceConstituent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spice_constituent_params
      params.require(:spice_constituent).permit(:spice_id, :constituent_id, :amount)
    end
end
