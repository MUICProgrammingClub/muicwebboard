class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.text :first_name
      t.text :last_name

      t.timestamps null: false
    end
  end
end
