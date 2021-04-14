class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_super_admin?

  def index
    #you dont want to set the permissions for Super Admin.
    @roles = Role.all.map{|i| i if (i.name != "Super Admin") }.compact
  end

  def show
    @role = Role.find(params[:id])
    @permissions = @role.permissions
  end

  def edit
    @role = Role.find(params[:id])
    #we dont want the Drawing permissions to be displayed.
    #this way u can display only selected models. you can choose which methods u want to display too.
    @permissions = Permission.all.map{|i| i if (["Part"].include? i.subject_class) }.compact
    @role_permissions = @role.permissions.collect{|p| p.id}
  end

  def update
    @role = Role.find(params[:id])
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]
    if @role.save
      redirect_to roles_path and return
    end
    @permissions = Permission.all.map{|i| i if (["Part"].include? i.subject_class) }.compact
    render 'edit'
  end

  private
 
  def is_super_admin?
    redirect_to root_path and return unless current_user.super_admin?
  end
end
