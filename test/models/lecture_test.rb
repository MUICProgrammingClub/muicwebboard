# == Schema Information
#
# Table name: lectures
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  course_id         :integer
#  instructor_id     :integer
#  term_id           :integer
#  lecture_name      :text
#  chapter           :text
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
