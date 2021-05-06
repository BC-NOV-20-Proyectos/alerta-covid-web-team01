module Api
  module V1
    class UsersController < Api::V1::ApiController
      
      def update
        render status: :bad_request if @current_user.email != user_params[:email]
        if @current_user.update(user_params)
            render json: { message: 'User updated successfully' }, status: :ok
        else
            render json: { errors: @current_user.errors }, status: :bad_request
        end
      end

      def update_password
        render status: :bad_request if @current_user.email != user_password_params[:email]
        @current_user.password, @current_user.password_confirmation = user_password_params[:password], user_password_params[:password]
        if @current_user.save
            render json: { message: 'User password updated successfully' }, status: :ok
        else
            render json: { errors: @current_user.errors }, status: :bad_request
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :full_name, :lastname, :born_date, :gender)
      end

      def user_password_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
