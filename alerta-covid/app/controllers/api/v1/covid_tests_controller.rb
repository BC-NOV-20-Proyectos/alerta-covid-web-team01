class Api::V1::CovidTestsController < Api::V1::ApiController

  def index
    covid_tests = CovidTest.all
    render json: covid_tests, status: :ok
  end
end
