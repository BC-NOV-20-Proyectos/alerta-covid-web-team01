class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_super_admin?
  before_action :set_role, only: %i[show edit update destroy]

  load_and_authorize_resource
  before_action :load_permissions

  def index
    #you dont want to set the permissions for Super Admin.
    @roles = Role.all.where.not(name: "Super Admin").paginate(page: params[:page], per_page: 10)
  end

  def show
    @permissions = @role.permissions
  end

  def new
    @permissions = Permission.all.map{ |i| i if (["all"].exclude? i.subject_class) }.compact
    @role = Role.new
  end

  def edit
    #we dont want the Drawing permissions to be displayed.
    #this way u can display only selected models. you can choose which methods u want to display too.
    @permissions = Permission.all.map{|i| i if (["all"].exclude? i.subject_class) }.compact
    @role_permissions = @role.permissions.collect{|p| p.id}
  end

  def create
    @role = Role.new(role_params)
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]
    @permissions = Permission.all.map{ |i| i if (["all"].exclude? i.subject_class) }.compact
    if @role.save
      redirect_to @role, notice: "Role was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]
    if @role.save
      redirect_to roles_path and return
    end
    @permissions = Permission.all.map{|i| i if (["all"].exclude? i.subject_class) }.compact
    render 'edit'
  end

  def destroy
    if(@role.users.count == 0)
      @role.destroy
      redirect_to roles_url, notice: "Role was successfully destroyed."
    else
      redirect_to roles_url, alert: "Role is being using by users."
    end
  end

  private

  def is_super_admin?
    redirect_to root_path and return unless current_user.super_admin?
  end

  def role_params
    params.require(:role).permit(:name)
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
