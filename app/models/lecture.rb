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

class Lecture < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :instructor
  belongs_to :term

  has_many :lecture_files, :dependent => :destroy
  has_many :reviews

  

end
