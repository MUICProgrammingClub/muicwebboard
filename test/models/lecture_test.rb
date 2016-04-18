# == Schema Information
#
# Table name: lectures
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  course_id     :integer
#  instructor_id :integer
#  term_id       :integer
#  lecture_name  :text
#  chapter       :text
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
