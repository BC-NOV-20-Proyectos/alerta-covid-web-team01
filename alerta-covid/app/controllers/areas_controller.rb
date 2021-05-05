class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]
  before_action :get_institutions, only: %i[ new edit]

  # GET /areas or /areas.json
  def index
    if(current_user.super_admin?)
      @areas = Area.all.order(:institution_id)
    else
      @areas = Area.all.includes(:institution).where(institution_id: current_institution.id)
    end
  end

  # GET /areas/1 or /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas or /areas.json
  def create
    if(current_user.super_admin?)
      @area = Area.new(area_params_super)
    else
      @area = Area.new(area_params)
      @area.institution_id = current_institution.id
    end
    if @area.save
      redirect_to @area, notice: "Area was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    update_params = current_user.super_admin? ? area_params_super : area_params
    if @area.update(update_params)
      redirect_to @area, notice: "Area was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /areas/1 or /areas/1.json
  def destroy
    @area.destroy
    redirect_to areas_url, notice: "Area was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_params
      params.require(:area).permit(:name)
    end

    def area_params_super
      params.require(:area).permit(:institution_id, :name)
    end

    def get_institutions
      @institutions = Institution.all
    end
end
