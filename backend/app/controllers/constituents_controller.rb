class ConstituentsController < ApplicationController
  before_action :set_constituent, only: [:show, :update, :destroy]

  # GET /constituents
  def index
    @constituents = Constituent.all

    render json: @constituents
  end

  # GET /constituents/1
  def show
    render json: @constituent
  end

  # POST /constituents
  def create
    @constituent = Constituent.new(constituent_params)

    if @constituent.save
      render json: @constituent, status: :created, location: @constituent
    else
      render json: @constituent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /constituents/1
  def update
    if @constituent.update(constituent_params)
      render json: @constituent
    else
      render json: @constituent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /constituents/1
  def destroy
    @constituent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constituent
      @constituent = Constituent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def constituent_params
      params.require(:constituent).permit(:spice_id, :compound, :description)
    end
end
