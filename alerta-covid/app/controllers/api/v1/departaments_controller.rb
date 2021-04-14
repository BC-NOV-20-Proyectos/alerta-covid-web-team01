class Api::V1::DepartamentsController < Api::V1::ApiController

  # GET /departaments or /departaments.json
  def index
    @departaments = Departament.all
    render json: @departaments, status: :ok
  end
end
