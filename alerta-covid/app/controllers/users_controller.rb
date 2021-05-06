class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :load_permissions
  
  def index
    @users = User.all.includes(:role)
    @user = User.new
  end

  def new
    @roles = Role.all
    @departments = Departament.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user, flash[:notice] = User.new, 'User created, email notification sent'
    else
      flash[:error] = 'User not created'
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role_id, :departament_id, :full_name, :lastname, :born_date, :gender)
  end
end
