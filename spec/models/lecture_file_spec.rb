# == Schema Information
#
# Table name: lecture_files
#
#  id                 :integer          not null, primary key
#  lecture_id         :integer
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  file_file_name     :string
#  file_content_type  :string
#  file_file_size     :integer
#  file_updated_at    :datetime
#

require 'rails_helper'

RSpec.describe LectureFile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
