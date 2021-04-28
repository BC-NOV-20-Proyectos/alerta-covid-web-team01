class Symptom < ApplicationRecord
  has_many :incidence_symptoms
  has_many :incidents, through: :incidence_symptoms
end