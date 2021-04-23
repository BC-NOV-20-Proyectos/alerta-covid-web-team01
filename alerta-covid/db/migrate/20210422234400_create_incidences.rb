class CreateIncidences < ActiveRecord::Migration[6.1]
  def change
    create_table :incidences do |t|
      t.integer  :user_id
      t.integer :covid_test_id
      t.boolean :result
      t.datetime :delivery
      t.datetime :open
      t.datetime :close
      
      t.timestamps
    end
  end
end
