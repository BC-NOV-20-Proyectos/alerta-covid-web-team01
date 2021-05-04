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

  def has_role?(role_name)
    Role.all.any? {|role| role.name == role_name}
  end

  def is_admin?
    has_role?("Super Admin")
  end
  
end
