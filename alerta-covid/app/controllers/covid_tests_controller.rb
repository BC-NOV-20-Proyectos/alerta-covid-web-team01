class CovidTestsController < ApplicationController
  # GET /covid_tests or /covid_tests.json
  def index
    @covid_tests = CovidTest.all
  end
end
