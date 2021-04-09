class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]

  # GET /areas or /areas.json
  def index
    @areas = Area.all
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
    @area = Area.new(area_params)
    if @area.save
      redirect_to @area, notice: "Area was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    if @area.update(area_params)
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
      params.require(:area).permit(:institution_id, :name)
    end
end
