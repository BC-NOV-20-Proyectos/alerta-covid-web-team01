class AddToFullNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :lastname, :string
    add_column :users, :born_date, :date
    add_column :users, :gender, :string
  end
end
