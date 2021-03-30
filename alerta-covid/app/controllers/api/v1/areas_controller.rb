class Api::V1::AreasController < Api::V1::ApiController
  before_action :set_area, only: %i[ show ]
  skip_before_action :verify_authenticity_token

  # GET /areas or /areas.json
  def index
    @areas = Area.all
    render json: @areas, status: :ok
  end

  # GET /areas/1 or /areas/1.json
  def show
    render json: @areas, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end
end
