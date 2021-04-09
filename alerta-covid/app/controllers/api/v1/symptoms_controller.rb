class Api::V1::SymptomsController < Api::V1::ApiController

    def index
        symptom = Symptom.all
        render json: symptom, status: :ok
    end
end
