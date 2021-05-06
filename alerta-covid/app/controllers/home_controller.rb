class HomeController < ActionController::Base
  layout 'application'
  skip_before_action :verify_authenticity_token

  def home
    respond_to do |format|
      format.html {
      }
      format.json {
        render json: { message: 'Alerta-Covid Home' }, status: :ok
      }
    end
  end
end
