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

require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
