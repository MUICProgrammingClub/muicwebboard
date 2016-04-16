class AddAttachmentImageToLectureFiles < ActiveRecord::Migration
  def self.up
    change_table :lecture_files do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lecture_files, :image
  end
end
