class AddCourseTagToWorks < ActiveRecord::Migration
  def change
    add_column :works, :course_tag, :text
  end
end
