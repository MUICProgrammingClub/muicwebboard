# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  lecture_id :integer
#  content    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture

  validates :user_id, presence: true
  validates :lecture_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
