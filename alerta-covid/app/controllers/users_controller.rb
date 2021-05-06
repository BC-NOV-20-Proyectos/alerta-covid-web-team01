class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :load_permissions
  
  def index
    if(current_user.super_admin?)
      @users = User.all.includes(:role).order(:full_name)
    else
      @users = User.all.includes(:role).joins(:departament).where('departament.institution_id' => current_institution.id).order(:full_name)
    end
  end

  def new
    if(current_user.super_admin?)
      @roles = Role.all
      @departments = Departament.all
    else
      @roles = Role.all.where(name: ["Data Reporter", "Final User"])
      @departments = Departament.all.where(institution_id: current_institution.id)
    end
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
