class CovidTestsController < ApplicationController
  before_action :set_covid_test, only: %i[ show edit update destroy ]

  # GET /covid_tests or /covid_tests.json
  def index
    @covid_tests = CovidTest.all
  end

  # GET /covid_tests/1 or /covid_tests/1.json
  def show
  end

  # GET /covid_tests/new
  def new
    @covid_test = CovidTest.new
  end

  # GET /covid_tests/1/edit
  def edit
  end

  # POST /covid_tests or /covid_tests.json
  def create
    @covid_test = CovidTest.new(covid_test_params)

    respond_to do |format|
      if @covid_test.save
        format.html { redirect_to @covid_test, notice: "Covid test was successfully created." }
        format.json { render :show, status: :created, location: @covid_test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @covid_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covid_tests/1 or /covid_tests/1.json
  def update
    respond_to do |format|
      if @covid_test.update(covid_test_params)
        format.html { redirect_to @covid_test, notice: "Covid test was successfully updated." }
        format.json { render :show, status: :ok, location: @covid_test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @covid_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covid_tests/1 or /covid_tests/1.json
  def destroy
    @covid_test.destroy
    respond_to do |format|
      format.html { redirect_to covid_tests_url, notice: "Covid test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_covid_test
      @covid_test = CovidTest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def covid_test_params
      params.require(:covid_test).permit(:name)
    end
end
