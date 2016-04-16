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
#

class LectureFile < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :user
  has_attached_file :image, :styles => { :pdf_thumbnail => ["", :jpg], :thumb => "100x100#", :medium => "200x200" }
  validates_attachment :image, :content_type => {:content_type => %w(image/jpeg image/jpg image/png image/gif application/pdf)}

end
