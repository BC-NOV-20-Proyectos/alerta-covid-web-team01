class Area < ApplicationRecord
  belongs_to :institution
  validates :institution, :name, presence: true
end
