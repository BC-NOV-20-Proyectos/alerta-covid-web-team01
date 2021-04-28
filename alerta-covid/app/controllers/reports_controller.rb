class ReportsController < ApplicationController
  def users
    commit = params[:commit]
    @reports = get_reports_by_users(commit)
  end

  def places
  end

  private
  
  def get_reports_by_users(commit)
    start = params[:start] if params[:start]
    finish = params[:finish] if params[:finish]
    if(commit == "all")
      Incidence.all.where(result: true)
    else
      Incidence.all.where(result: true, open: start..finish)
    end
  end
end 