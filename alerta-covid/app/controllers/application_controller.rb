class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = 'Access denied. You are not authorized to access the requested page.'
    redirect_to root_path
  end

  protected

  #derive the model name from the controller. egs UsersController will return User
  def self.permission
    return name = self.name.gsub('Controller', '').singularize.split('::').last.constantize.name rescue nil
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  #load the permissions for the current user so that UI can be manipulated
  def load_permissions
    if current_user != nil
      @current_permissions = current_user.role.permissions.collect { |i| [i.subject_class, i.action] }
    end
  end
  
  def current_institution
    @current_institution ||= current_user.departament.institution if current_user
  end
end
