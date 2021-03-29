class SymptomsController < ApplicationController

  # GET /symptoms or /symptoms.json
  def index
    @symptoms = Symptom.all
  end
end
