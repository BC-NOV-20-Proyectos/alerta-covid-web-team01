class InstitutionsController < ApplicationController
  before_action :set_institution, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  before_action :load_permissions

  # GET /institutions or /institutions.json
  def index
    if(current_user.super_admin?)
      @institutions = Institution.all
    else
      @institutions = Institution.all.where(id: current_institution.id)
    end
  end

  # GET /institutions/1 or /institutions/1.json
  def show
  end

  # GET /institutions/new
  def new
    @institution = Institution.new
  end

  # GET /institutions/1/edit
  def edit
  end

  # POST /institutions or /institutions.json
  def create
    if(current_user.super_admin?)
      @institution = Institution.new(institution_params)
      if @institution.save
        redirect_to @institution, notice: "Institution was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /institutions/1 or /institutions/1.json
  def update
    if(current_user.super_admin?)
      if @institution.update(institution_params)
        redirect_to @institution, notice: "Institution was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /institutions/1 or /institutions/1.json
  def destroy
    if(current_user.super_admin?)
      @institution.destroy
      redirect_to institutions_url, notice: "Institution was successfully destroyed."
    end
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
