class Api::V1::DepartamentsController < Api::V1::ApiController
  before_action :set_departament, only: %i[ show ]
  skip_before_action :verify_authenticity_token

  # GET /departaments or /departaments.json
  def index
    @departaments = Departament.all
    render json: @departaments, status: :ok
  end

  # GET /departaments/1 or /departaments/1.json
  def show
    render json: @departaments, status: :ok
  end

  # GET /departaments/new
  def new
    @departament = Departament.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departament
      @departament = Departament.find(params[:id])
    end

end
