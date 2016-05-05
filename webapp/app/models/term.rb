# == Schema Information
#
# Table name: terms
#
#  id             :integer          not null, primary key
#  term_formatted :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Term < ActiveRecord::Base
  has_many :lectures

  validates :term_formatted, presence: true
end
