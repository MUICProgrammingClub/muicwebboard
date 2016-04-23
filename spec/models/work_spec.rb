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

require 'rails_helper'

RSpec.describe Work, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
