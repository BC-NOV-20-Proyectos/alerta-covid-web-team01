class Api::V1::AreasController < Api::V1::ApiController

  # GET /areas or /areas.json
  def index
    @areas = Area.all
    render json: @areas, status: :ok
  end
end
