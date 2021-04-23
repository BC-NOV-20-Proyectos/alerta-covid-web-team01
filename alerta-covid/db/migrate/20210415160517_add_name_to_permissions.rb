class AddNameToPermissions < ActiveRecord::Migration[6.1]
  def change
    add_column :permissions, :name, :string
    add_column :permissions, :description, :text
  end
end
