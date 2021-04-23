class CovidTest < ApplicationRecord
  validates :name, presence: true
  has_many  :incidence
end
