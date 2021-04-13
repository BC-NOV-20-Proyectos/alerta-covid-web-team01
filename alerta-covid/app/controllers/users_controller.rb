class UsersController < ApplicationController

    def index
        @users = User.all
        @user  = User.new
    end

    def create
        @user = User.new(user_params)
        @user.password, @user.password_confirmation = 'pass123456', 'pass123456'
        if @user.save
            @user, flash[:notice] = User.new, 'User created, email notification sent'
        else
            flash[:error] = 'User not created'
        end
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:email)
    end
end
