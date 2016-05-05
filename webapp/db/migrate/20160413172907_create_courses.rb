class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :course_code
      t.text :course_name

      t.timestamps null: false
    end
  end
end
