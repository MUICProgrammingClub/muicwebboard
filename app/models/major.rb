# == Schema Information
#
# Table name: majors
#
#  id         :integer          not null, primary key
#  major_name :text
#  major_code :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Major < ActiveRecord::Base
  has_many :users
end
