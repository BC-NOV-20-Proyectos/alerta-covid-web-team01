class AddBeginToIncidents < ActiveRecord::Migration[6.1]
  def change
    add_column :incidences, :begin, :datetime
  end
end