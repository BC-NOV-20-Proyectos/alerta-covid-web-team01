class IncidencePlace < ApplicationRecord
  belongs_to :incidence
  belongs_to :place
end
