# == Schema Information
#
# Table name: lecture_files
#
#  id         :integer          not null, primary key
#  lecture_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe LectureFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
