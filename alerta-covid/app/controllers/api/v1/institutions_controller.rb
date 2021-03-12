class Api::V1::InstitutionsController < ApplicationController
    before_action :set_institution, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token
  
    # GET api/v1/institutions or /institutions.json
    def index
      institutions = Institution.all
      render json: {status: 200, data: institutions} 
    end
  
    # GET api/v1/institutions/1 or /institutions/1.json
    def show
      render json: {status: 200, data: @institution}
    end
  
    # POST api/v1/institutions or /institutions.json
    def create
      begin
        @institution = Institution.new(institution_params)
    
        if @institution.save
          render json: {status: 200, data: @institution }
        else
          render json: {msg: @institution.errors, status: 500}
        end 
      rescue
        render json: {msg: :server_error, status: 500}
      end
    end
  
    # PATCH/PUT api/v1/institutions/1 or /institutions/1.json
    def update
      begin
        if @institution.update(institution_params)
          render json: {status: 200, location: @institution }
        else
          render json: {msg: @institution.errors, status: 500}
        end
      rescue
        render json: {msg: :server_error, status: 500}
      end
    end
  
    # DELETE api/v1/institutions/1 or /institutions/1.json
    def destroy
      @institution.destroy
      render json: {status: 200, data: @institution }
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_institution
        begin
          @institution = Institution.find(params[:id])
        rescue
          render json: {msg: :not_found, status: 404}
        end
      end
  
      # Only allow a list of trusted parameters through.
      def institution_params
        params.require(:institution).permit(:name)
      end
  end
  