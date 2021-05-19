class Departament < ApplicationRecord
  validates :name, presence: true
  validates :institution, presence: true
  belongs_to :institution
  has_many :users
end
