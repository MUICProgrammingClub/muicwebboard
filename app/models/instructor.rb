# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  first_name :text
#  last_name  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Instructor < ActiveRecord::Base
  has_many :lectures

  def full_name 
  	"#{first_name} #{last_name}"
  end
end
