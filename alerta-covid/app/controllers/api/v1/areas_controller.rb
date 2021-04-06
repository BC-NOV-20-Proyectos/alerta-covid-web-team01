class Api::V1::AreasController < Api::V1::ApiController
  skip_before_action :verify_authenticity_token
  def index
    @areas = Area.all
    render json: @areas, status: :ok
  end
end
