class CreateIncidencePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :incidence_places do |t|
      t.integer :incidence_id
      t.integer :place_id
    end
  end
end
