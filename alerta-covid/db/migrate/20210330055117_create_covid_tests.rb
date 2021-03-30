class CreateCovidTests < ActiveRecord::Migration[6.1]
  def change
    create_table :covid_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
