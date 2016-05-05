# == Schema Information
#
# Table name: terms
#
#  id             :integer          not null, primary key
#  term_formatted :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Term, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
