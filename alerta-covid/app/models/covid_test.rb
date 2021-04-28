class CovidTest < ApplicationRecord
  validates :name, presence: true
  has_many  :incidences
end
