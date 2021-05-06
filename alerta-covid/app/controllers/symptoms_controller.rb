class SymptomsController < ApplicationController
  
  load_and_authorize_resource
  before_action :load_permissions

  # GET /symptoms 
  def index
    @symptoms = Symptom.all
  end
end
