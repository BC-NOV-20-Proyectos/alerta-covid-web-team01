class Api::V1::IncidencesController < Api::V1::ApiController
  def index
    @incidences = Incidence.all
    render json: @incidences, status: :ok
  end

  def create
    @incidence = Incidence.new(incidence_params)
    @incidence.open = DateTime.now()
    set_variables_with_params()
    if @incidence.save
      render json: @incidence, status: :created
    else
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def update
    set_variables_with_params()
    if @incidence.update(incidence_params_update)
      render json: @incidence, status: :ok
    else
      rrender json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def incidence_params
    params.require(:incidence).permit(:covid_test_id, :user_id, :begin)
  end

  def incidence_params_update
    params.require(:incidence).permit(:delivery, :result)
  end

  def set_variables_with_params
    @incidence.set_symptoms(params[:symp]) if params[:symp]
    @incidence.set_places(params[:places]) if params[:places]
  end
end