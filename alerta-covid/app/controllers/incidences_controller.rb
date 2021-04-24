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
    @user_places = @incidence.places.collect{|p| p.id}
  end

  # POST /incidences or /incidences.json
  def create
    @incidence = Incidence.new(incidence_params)
    @incidence.user = current_user
    @incidence.open = DateTime.now()
    set_variables_with_params()
    if @incidence.save
      redirect_to @incidence, notice: 'Incidence was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incidences/1 or /incidences/1.json
  def update
    set_variables_with_params()
    
    if @incidence.update(incidence_params_update)
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
    params.require(:incidence).permit(:covid_test_id, :user_id, :begin)
  end

  def incidence_params_update
    params.require(:incidence).permit(:delivery, :result)
  end

  def set_variables
    @tests = CovidTest.all.map { |test| [test.name, test.id] }
    @symptoms = Symptom.all
    @places = Place.all
  end

  def set_variables_with_params
    puts("desde set params #{params.require(:incidence).inspect}")
    @incidence.set_symptoms(params[:symp]) if params[:symp]
    @incidence.set_places(params[:places]) if params[:places]
  end

  def set_user_symptoms
    @user_symptoms = []
    @user_places = []
  end
end
