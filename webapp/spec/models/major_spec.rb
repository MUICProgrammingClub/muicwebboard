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

require 'rails_helper'

RSpec.describe Major, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
