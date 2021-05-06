class DepartamentsController < ApplicationController
  before_action :set_departament, only: %i[ show edit update destroy ]
  before_action :get_institutions, only: %i[ new edit]

  load_and_authorize_resource
  before_action :load_permissions

  # GET /departaments or /departaments.json
  def index
    @departaments = Departament.all.includes(:institution)
  end

  # GET /departaments/1 or /departaments/1.json
  def show
  end

  # GET /departaments/new
  def new
    @departament = Departament.new
  end

  # GET /departaments/1/edit
  def edit
  end

  # POST /departaments or /departaments.json
  def create
    @departament = Departament.new(departament_params)
    if @departament.save
      redirect_to @departament, notice: "Departament was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departaments/1 or /departaments/1.json
  def update
    if @departament.update(departament_params)
      redirect_to @departament, notice: "Departament was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /departaments/1 or /departaments/1.json
  def destroy
    @departament.destroy
    redirect_to departaments_url, notice: "Departament was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departament
      @departament = Departament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def departament_params
      params.require(:departament).permit(:institution_id, :name)
    end

    def get_institutions
      @institutions=Institution.all
    end
end
