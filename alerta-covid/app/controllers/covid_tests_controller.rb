class CovidTestsController < ApplicationController
  
  load_and_authorize_resource
  before_action :load_permissions

  # GET /covid_tests or /covid_tests.json
  def index
    @covid_tests = CovidTest.all
  end
end
