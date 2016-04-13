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

require 'rails_helper'

RSpec.describe Instructor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
