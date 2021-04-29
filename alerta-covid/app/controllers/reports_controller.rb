class ReportsController < ApplicationController
  def users
    commit = params[:commit]
    @reports = get_reports_by_users(commit)
  end

  def places
    @reports = get_reports_by_places(params[:option])
  end

  private
  
  def get_reports_by_users(commit)
    start = params[:start] if params[:start]
    finish = params[:finish] if params[:finish]
    if(commit == "all")
      Incidence.all
    else
      Incidence.all.where(open: start..finish)
    end
  end

  def get_reports_by_places(option)
    case option
    when "3"
      Place.joins(:area).order(:institution_id)
    when "2"
      Place.all.order(:area_id)
    when "1"
      Place.all.order(:id)
    else
      places = Place.all
      places.sort_by{ |place|
        place.incidences.select{ |incidence| incidence.result == true }.count
      }.reverse
    end
  end
end 