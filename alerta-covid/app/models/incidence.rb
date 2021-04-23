class Incidence < ApplicationRecord
  validates :user_id, presence: true
  validates :covid_test_id, presence: true
  validates :result, presence: true
  validates :open, presence: true

  belongs_to :user
  belongs_to :covid_test
end
