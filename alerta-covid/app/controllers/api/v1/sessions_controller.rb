module Api
  module V1
    class SessionsController < Api::V1::ApiController
      respond_to :json
      before_action :authorized, only: [:auto_login]

      def create
        @current_user = User.find_by(email: params[:user][:email])
        render json: { error: 'Unconfirmed user' }, status: :unauthorized if @current_user.confirmed_at.blank?
        if @current_user.present? && (@current_user.valid_password? params[:user][:password])
          token = encode_token({user_id: @current_user.id, user_email: @current_user.email})
          render json: { user: @current_user.slice(:id, :email, :full_name, :lastname, :born_date, :gender), token: token }
        else
          render json: { error: 'Invalidad resource' }, status: :unauthorized
        end
      end

      def auto_login
        render json: @current_user
      end
    end
  end
end
