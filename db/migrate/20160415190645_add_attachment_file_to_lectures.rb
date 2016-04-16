class AddAttachmentFileToLectures < ActiveRecord::Migration
  def self.up
    change_table :lectures do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :lectures, :file
  end
end
