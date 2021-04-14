class Api::V1::PlacesController < Api::V1::ApiController

  # GET /places or /places.json
  def index
    @places = Place.all
    render json: @places, status: :ok
  end
end