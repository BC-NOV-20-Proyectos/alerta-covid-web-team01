class AddRoleIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :role, index: true
    add_foreign_key :users, :roles
  end
end
