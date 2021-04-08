class Api::V1::InstitutionsController < Api::V1::ApiController
  
    # GET api/v1/institutions
    def index
      @institutions = Institution.all
      render json: @institutions, status: :ok
    end
  end
  