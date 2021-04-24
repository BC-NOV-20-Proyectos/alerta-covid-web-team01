class Incidence < ApplicationRecord
  validates :user_id, presence: true
  validates :covid_test_id, presence: true
  validates :open, presence: true
  validates :begin, presence: true

  belongs_to :user
  belongs_to :covid_test
  has_many :incidence_symptoms
  has_many :symptoms, through: :incidence_symptoms
  has_many :incidence_places
  has_many :places, through: :incidence_places

  before_update :set_close

  def set_symptoms(symptoms)
    self.symptoms = []
    symptoms.each do |id|
      symp = Symptom.find(id)
      self.symptoms << symp
    end
  end

  def set_places(places)
    self.places = []
    places.each do |id|
      place = Place.find(id)
      self.places << place
    end
  end

  def set_close
    self.close = DateTime.now if close.nil? && !delivery.nil?
  end

  def has_symptoms
    self.symptoms.count > 0 ? "Yes" : "No"
  end
end
