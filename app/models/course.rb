# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_code :text
#  course_name :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
  has_many :lectures

  def name_code
  		"#{course_code} #{course_name}"
  end

end
