class IncidencesController < ApplicationController
  before_action :set_incidence, only: %i[show edit update destroy]
  before_action :set_variables, only: %i[new edit  create]

  # GET /incidences or /incidences.json
  def index
    @user = current_user
    @incidences = @user.incidence
  end

  # GET /incidences/1 or /incidences/1.json
  def show; end

  # GET /incidences/new
  def new
    @incidence = Incidence.new
  end

  # GET /incidences/1/edit
  def edit; end

  # POST /incidences or /incidences.json
  def create
    @incidence = Incidence.new(incidence_params)
    @incidence.user = current_user
    @incidence.open = Date.today
    if @incidence.save
      redirect_to @incidence, notice: 'Incidence was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incidences/1 or /incidences/1.json
  def update
    respond_to do |_format|
      if @incidence.update(incidence_params)
        redirect_to @incidence, notice: 'Incidence was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_incidence
    @incidence = Incidence.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def incidence_params
    params.require(:incidence).permit(:result, :delivery, :covid_test_id, :user_id)
  end

  def set_variables
    @tests = CovidTest.all.map { |test| [test.name, test.id] }
    @symptoms = Symptom.all
  end
end
