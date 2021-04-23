class Incidence < ApplicationRecord
  validates :user_id, presence: true
  validates :covid_test_id, presence: true
  validates :result, presence: true
  validates :open, presence: true
  validates :delivery, presence: true

  belongs_to :user
  belongs_to :covid_test
  has_many :incidence_symptoms
  has_many :symptoms, through: :incidence_symptoms

  def set_symptoms(symptoms)
    self.symptoms = []
    symptoms.each do |id|
      symp = Symptom.find(id)
      self.symptoms << symp
    end
  end
end
