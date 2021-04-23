class IncidencesController < ApplicationController
  before_action :set_incidence, only: %i[show edit update destroy]
  before_action :set_variables, only: %i[new edit create update]
  before_action :set_user_symptoms, only: %i[new edit create update]

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
  def edit
    @user_symptoms = @incidence.symptoms.collect{|p|p.id}
  end

  # POST /incidences or /incidences.json
  def create
    @incidence = Incidence.new(incidence_params)
    @incidence.user = current_user
    @incidence.open = DateTime.now()
    @incidence.set_symptoms(params[:symp]) if params[:symp]
    if @incidence.save
      redirect_to @incidence, notice: 'Incidence was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incidences/1 or /incidences/1.json
  def update
    @incidence.set_symptoms(params[:symp]) if params[:symp]

    if @incidence.update(incidence_params)
      redirect_to @incidence, notice: 'Incidence was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
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

  def set_user_symptoms
    @user_symptoms = []
  end
end
