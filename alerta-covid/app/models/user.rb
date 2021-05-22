class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  belongs_to :role
  belongs_to :departament
  has_many :incidence

  def super_admin?
    self.role.name == "Super Admin"
  end

  def admin_institution?
    self.role.name == "Admin Institution"
  end

  def final_user?
    self.role.name == "Final User"
  end

  def is_signed_in?
    true if user_signed_in?
  end

  def has_role?(role_name)
    Role.all.any? {|role| role.name == role_name}
  end

  def is_admin?
    has_role?("Super Admin")
  end
  
end
