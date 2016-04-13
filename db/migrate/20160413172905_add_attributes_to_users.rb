class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :student_id_number, :integer
    add_column :users, :phone_number, :text
  end
end
