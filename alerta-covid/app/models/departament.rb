class Departament < ApplicationRecord
  belongs_to :institution
  has_many :users
end
