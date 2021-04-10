class Place < ApplicationRecord
  belongs_to :area
  validates :name, :area, presence: true
end
