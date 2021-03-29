class Api::V1::SymptomsController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token

    def index
        symptom = Symptom.all
        render json: symptom, status: :ok
    end

end
