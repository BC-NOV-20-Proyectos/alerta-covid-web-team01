class Api::V1::ReportsController < Api::V1::ApiController
  def users
    reports = get_reports_by_users
    render json: {data: reports.as_json}, status: :ok
  end

  def places
    render json: [], status: :ok
  end

  def get_reports_by_users
    start = params[:start] if params[:start]
    finish = params[:finish] if params[:finish]
    if(finish && start)
      Incidence.all.where(open: start..finish)
    else
      Incidence.all
    end
  end
end

