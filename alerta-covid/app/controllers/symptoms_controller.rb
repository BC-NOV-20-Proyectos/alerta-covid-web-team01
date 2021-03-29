class SymptomsController < ApplicationController

  # GET /symptoms 
  def index
    @symptoms = Symptom.all
  end
end
