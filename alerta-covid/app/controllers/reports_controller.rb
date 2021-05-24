class ReportsController < ApplicationController

  def users
    authorize! :users, ReportsController
    commit = params[:commit]
    @reports = get_reports_by_users(commit)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'reports/usersreport', pdf: 'usersreport', layout: 'pdf.html' }
    end
  end

  def places
    authorize! :places, ReportsController
    @reports = get_reports_by_places(params[:option], params[:commit])
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'reports/placesreport', pdf: 'placesreport', layout: 'pdf.html' }
    end
  end

  private
  
  def get_reports_by_users(commit)
    start = params[:start] if params[:start]
    finish = params[:finish] if params[:finish]
    if(commit == "all")
      if(current_user.super_admin?)
        Incidence.all
      else
        Incidence.all.select{ |incidence| incidence.user.departament.institution == current_institution }
      end
    else
      if(current_user.super_admin?)
        Incidence.all.where(open: start..finish)
      else
        Incidence.all.where(open: start..finish).select{ |incidence| incidence.user.departament.institution == current_institution }
      end
    end
  end

  def get_reports_by_places(option, commit)
    if(current_user.super_admin?)
      places_sorted = Place.all.sort_by{ |place|
        place.incidences.where(result: true, delivery: 10.days.ago..Date.today).count
      }.reverse
    else
      places_sorted = Place.all.sort_by{ |place|
        place.incidences.where(result: true, delivery: 10.days.ago..Date.today).count
      }.reverse.select{ |place| place.area.institution == current_institution }
    end

    if(commit == "all")
      places_sorted
    else
      case option
      when "1"
        Place.all.order(:id).select{ |place| place.area.institution == current_institution }
      when "2"
        Place.all.order(:area_id).select{ |place| place.area.institution == current_institution }
      when "3"
        Place.joins(:area).order(:institution_id).select{ |place| place.area.institution == current_institution }
      else
        places_sorted.select{ |place|
          place.incidences.where(user_id: current_user.id)
        }
      end
    end
  end
end 