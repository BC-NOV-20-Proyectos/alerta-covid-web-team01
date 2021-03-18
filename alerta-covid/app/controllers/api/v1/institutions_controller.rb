class Api::V1::InstitutionsController < ApiController
    before_action :set_institution, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token
  
    # GET api/v1/institutions or /institutions.json
    def index
      @institutions = Institution.all
      render json: @institutions, status: :ok
    end
  
    # GET api/v1/institutions/1 or /institutions/1.json
    def show
      render json: @institution, status: :ok
    end
  
    # POST api/v1/institutions or /institutions.json
    def create
      @institution = Institution.new(institution_params)

      if @institution.save
        render json: @institution, status: :created
      else
        render json: @institution.errors, status: :unprocessable_entity
      end 
    end
  
    # PATCH/PUT api/v1/institutions/1 or /institutions/1.json
    def update
      if @institution.update(institution_params)
        render json: @institution, status: :ok
      else
        render json: @institution.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE api/v1/institutions/1 or /institutions/1.json
    def destroy
      @institution.destroy
      render json: @institution, status: :ok
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_institution
        @institution = Institution.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def institution_params
        params.require(:institution).permit(:name)
      end
  end
  