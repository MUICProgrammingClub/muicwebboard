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

require 'rails_helper'

RSpec.describe Lecture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
