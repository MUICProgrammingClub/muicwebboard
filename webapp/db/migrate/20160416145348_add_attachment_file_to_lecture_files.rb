class AddAttachmentFileToLectureFiles < ActiveRecord::Migration
  def self.up
    change_table :lecture_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :lecture_files, :file
  end
end
