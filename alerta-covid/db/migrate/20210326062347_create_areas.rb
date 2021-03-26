class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.references :institution, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
