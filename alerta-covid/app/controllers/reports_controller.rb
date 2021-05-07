class ReportsController < ApplicationController

  def users
    authorize! :users, ReportsController
    commit = params[:commit]
    @reports = get_reports_by_users(commit)
  end

  def places
    authorize! :places, ReportsController
    @reports = get_reports_by_places(params[:option], params[:commit])
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

  def get_reports_by_places(option, commit)
    places_sorted = Place.all.sort_by{ |place|
      place.incidences.where(result: true, delivery: 10.days.ago..Date.today).count
    }.reverse

    if(commit == "all")
      places_sorted
    else
      case option
      when "1"
        Place.all.order(:id)
      when "2"
        Place.all.order(:area_id)
      when "3"
        Place.joins(:area).order(:institution_id)
      else
        places_sorted.select{ |place|
          place.incidences.where(user_id: current_user.id)
        }
      end
    end
  end
end 