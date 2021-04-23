class IncidenceSymptom < ApplicationRecord
  belongs_to :incidence
  belongs_to :symptom
end
