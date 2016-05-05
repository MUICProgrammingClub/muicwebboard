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
#  approve       :boolean
#

class Lecture < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :instructor
  belongs_to :term

  has_many :lecture_files, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  validates :user_id, presence: true
  validates :course_id, presence: true
  validates :instructor_id, presence: true
  validates :term_id, presence: true
  validates :lecture_name, presence: true
  validates :chapter, presence: true

  after_create :assign_approve_status

  searchkick word_start: [:name], course_name: ["course_name"], instructor_name: ["instructor_name"], user_name: ["user_name"]

  def search_data
  	attributes.merge(
  		course_name: course(&:full_name),
  		instructor_name: instructor(&:full_name),
  		user_name: user(&:full_name),
  		term_name: term(&:term_formatted)
  	)

  end

  private

  def assign_approve_status
    self.approve = false
  end

end
