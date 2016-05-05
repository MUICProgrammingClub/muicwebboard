class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.text :major_name
      t.text :major_code

      t.timestamps null: false
    end
  end
end
