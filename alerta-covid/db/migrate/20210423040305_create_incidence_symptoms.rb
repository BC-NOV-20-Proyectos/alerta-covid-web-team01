class CreateIncidenceSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :incidence_symptoms do |t|
      t.integer :incidence_id
      t.integer :symptom_id
    end
  end
end
