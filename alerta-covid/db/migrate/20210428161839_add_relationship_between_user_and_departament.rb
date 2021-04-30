class AddRelationshipBetweenUserAndDepartament < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :departament, index: true
    add_foreign_key :users, :departaments
  end
end