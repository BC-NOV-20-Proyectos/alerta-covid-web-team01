module Api
  module V1
    class ConfirmationsController < ActionController::Base
      # GET "/api/v1/confirm_user
      def confirm_user
        user = User.confirm_by_token(params[:confirmation_token])
        if user.id.present?
          redirect_to api_v1_login_path(user: { email: user.email, password: 'pass123456' })
        else
          render json: { error: 'User Token Invalid' }, status: :unprocessable_entity
        end
      end
    end
  end
end
