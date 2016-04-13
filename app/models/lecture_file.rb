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

class LectureFile < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :user
end
