# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  category   :text
#  type       :text
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_tag :text
#  other_tag  :text
#

class RequestWork < Work

end
